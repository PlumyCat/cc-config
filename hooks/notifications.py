#!/usr/bin/env python3
"""
Hook de notifications pour Claude Code.
Envoie des notifications quand Claude attend une interaction.
"""
import json
import sys
import subprocess
import platform
import os

def send_notification(title: str, message: str) -> None:
    """Envoie une notification selon l'OS."""
    system = platform.system().lower()

    # Détecter si on est en SSH (pour afficher dans un fichier au lieu de notify-send)
    is_ssh = os.environ.get('SSH_CONNECTION') or os.environ.get('SSH_CLIENT')

    if is_ssh:
        # Mode SSH : écrire dans un fichier visible
        try:
            import datetime
            timestamp = datetime.datetime.now().strftime("%H:%M:%S")
            log_file = "/tmp/claude-notifications/latest.log"
            with open(log_file, "a") as f:
                f.write(f"\n{'='*50}\n")
                f.write(f"[{timestamp}] {title}\n")
                f.write(f"{message}\n")
                f.write(f"{'='*50}\n")
            # Aussi en garder un historique
            history_file = "/tmp/claude-notifications/history.log"
            with open(history_file, "a") as f:
                f.write(f"[{timestamp}] {title}: {message}\n")
        except Exception:
            pass
        # Essayer quand même le bell
        print("\a", end="", flush=True)
        return

    try:
        if system == "linux":
            # Linux avec notify-send
            subprocess.run([
                "notify-send", 
                title, 
                message,
                "--urgency=normal",
                "--expire-time=5000"
            ], check=False, timeout=5)
            
        elif system == "darwin":  # macOS
            # macOS avec osascript
            script = f'display notification "{message}" with title "{title}"'
            subprocess.run([
                "osascript", 
                "-e", 
                script
            ], check=False, timeout=5)
            
        elif system == "windows":
            # Windows avec PowerShell
            ps_script = f'''
            Add-Type -AssemblyName System.Windows.Forms
            $notification = New-Object System.Windows.Forms.NotifyIcon
            $notification.Icon = [System.Drawing.SystemIcons]::Information
            $notification.BalloonTipTitle = "{title}"
            $notification.BalloonTipText = "{message}"
            $notification.Visible = $true
            $notification.ShowBalloonTip(5000)
            '''
            subprocess.run([
                "powershell", 
                "-Command", 
                ps_script
            ], check=False, timeout=10)
            
    except subprocess.TimeoutExpired as e:
        # Log timeout error to stderr for debugging
        if os.environ.get('CLAUDE_HOOKS_DEBUG'):
            print(f"[notifications.py] Timeout: {e}", file=sys.stderr)
        # Fallback : bell system
        print("\a", end="", flush=True)
    except FileNotFoundError as e:
        # Log missing command to stderr for debugging
        if os.environ.get('CLAUDE_HOOKS_DEBUG'):
            print(f"[notifications.py] Command not found: {e.filename}", file=sys.stderr)
        # Fallback : bell system
        print("\a", end="", flush=True)
    except Exception as e:
        # Log unexpected errors
        if os.environ.get('CLAUDE_HOOKS_DEBUG'):
            print(f"[notifications.py] Error: {type(e).__name__}: {e}", file=sys.stderr)
        print("\a", end="", flush=True)

def play_sound(sound_type: str = "default") -> None:
    """Joue un son selon l'OS."""
    system = platform.system().lower()
    
    try:
        if system == "linux":
            # Linux avec paplay ou aplay
            if sound_type == "finish":
                subprocess.run(["paplay", "/usr/share/sounds/alsa/Front_Right.wav"], 
                             check=False, timeout=3)
            else:
                subprocess.run(["paplay", "/usr/share/sounds/alsa/Front_Left.wav"], 
                             check=False, timeout=3)
                
        elif system == "darwin":  # macOS
            # macOS avec afplay
            if sound_type == "finish":
                subprocess.run(["afplay", "/System/Library/Sounds/Glass.aiff"], 
                             check=False, timeout=3)
            else:
                subprocess.run(["afplay", "/System/Library/Sounds/Ping.aiff"], 
                             check=False, timeout=3)
                
        elif system == "windows":
            # Windows avec PowerShell
            if sound_type == "finish":
                subprocess.run(["powershell", "-c", "[console]::beep(800,200)"], 
                             check=False, timeout=3)
            else:
                subprocess.run(["powershell", "-c", "[console]::beep(400,200)"], 
                             check=False, timeout=3)
                
    except subprocess.TimeoutExpired as e:
        if os.environ.get('CLAUDE_HOOKS_DEBUG'):
            print(f"[notifications.py] Sound timeout: {e}", file=sys.stderr)
        print("\a", end="", flush=True)
    except FileNotFoundError as e:
        if os.environ.get('CLAUDE_HOOKS_DEBUG'):
            print(f"[notifications.py] Sound command not found: {e.filename}", file=sys.stderr)
        print("\a", end="", flush=True)

def main():
    """Point d'entrée principal du hook."""
    try:
        # Lire les données JSON depuis stdin
        input_data = json.load(sys.stdin)
        
        # Déterminer le type d'événement
        hook_event = input_data.get('hook_event_name', '')
        
        if hook_event == "Stop":
            # Tâche terminée
            send_notification(
                "Claude Code",
                "✅ Task completed successfully!"
            )
            play_sound("finish")

        elif hook_event == "Notification":
            # Claude attend une interaction
            event_data = input_data.get('event_data', {})
            event_type = event_data.get('event', 'permission_needed')

            if event_type == "permission_needed":
                send_notification(
                    "Claude Code",
                    "🔐 Waiting for your permission..."
                )
                play_sound("attention")
            else:
                send_notification(
                    "Claude Code",
                    "⏰ Waiting for your input..."
                )
                play_sound("attention")

        elif hook_event == "TeammateIdle":
            # Agent Teams: un teammate est idle
            event_data = input_data.get('event_data', {})
            teammate_name = event_data.get('teammate_name', 'unknown')
            send_notification(
                "Agent Teams",
                f"💤 Teammate '{teammate_name}' is idle"
            )
            play_sound("attention")

        elif hook_event == "TaskCompleted":
            # Agent Teams: une tâche est terminée
            event_data = input_data.get('event_data', {})
            task_subject = event_data.get('subject', event_data.get('task_name', 'unknown'))
            send_notification(
                "Agent Teams",
                f"✅ Task completed: {task_subject}"
            )
            play_sound("finish")

        sys.exit(0)
        
    except json.JSONDecodeError:
        sys.exit(0)  # Ignore invalid JSON
    except Exception:
        sys.exit(0)  # Ne jamais bloquer sur une erreur de notification

if __name__ == "__main__":
    main()