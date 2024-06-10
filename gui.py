import tkinter as tk
from tkinter import filedialog
import subprocess

def analyze_file():
    file_path = filedialog.askopenfilename()
    if file_path:
        result = subprocess.run(['./lexer'], input=open(file_path, 'r').read(), text=True, capture_output=True)
        output_text.delete('1.0', tk.END)
        output_text.insert(tk.END, result.stdout)

# Configurar la ventana principal
root = tk.Tk()
root.title("Analizador Léxico")

# Botón para seleccionar el archivo
btn_open = tk.Button(root, text="Abrir Archivo", command=analyze_file)
btn_open.pack(pady=10)

# Cuadro de texto para mostrar la salida
output_text = tk.Text(root, wrap=tk.WORD, width=80, height=20)
output_text.pack(pady=10)

# Ejecutar la aplicación
root.mainloop()
