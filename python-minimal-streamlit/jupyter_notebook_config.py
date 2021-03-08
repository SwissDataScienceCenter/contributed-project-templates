# Configuration file for jupyter-notebook.

c.ServerProxy.servers = {
    'streamlit': {
        'command': [
            'streamlit',
            'run',
            'helloworld.py',
            '--server.port', '8501',
            '--browser.serverAddress', '0.0.0.0',
        ],
        'port': 8501,
        'timeout': 60
    }
}
