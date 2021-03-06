Cuttlefish management software:
  pkg.installed:
    - pkgs:
      - kubectl
      - helm
      - fluxctl
  file.managed:
    - name: /home/david/.kube/config
    - makedirs: True
    - user: david
    - group: david
    - contents: |
        apiVersion: v1
        clusters:
        - cluster:
            certificate-authority-data: LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUJkekNDQVIyZ0F3SUJBZ0lCQURBS0JnZ3Foa2pPUFFRREFqQWpNU0V3SHdZRFZRUUREQmhyTTNNdGMyVnkKZG1WeUxXTmhRREUyTURZNE1EQXdPVFl3SGhjTk1qQXhNakF4TURVeU1UTTJXaGNOTXpBeE1USTVNRFV5TVRNMgpXakFqTVNFd0h3WURWUVFEREJock0zTXRjMlZ5ZG1WeUxXTmhRREUyTURZNE1EQXdPVFl3V1RBVEJnY3Foa2pPClBRSUJCZ2dxaGtqT1BRTUJCd05DQUFRdVVvdVFNd01taUluVjRmcFVWQ20vdVFkQUZQTEg5Q3MvaU40UyswbXoKVUdhaGZQQUVEeWJyY1lCc1d6eDRvTUY1bjVpbDYzWmZYdU42MnVpRFJuT29vMEl3UURBT0JnTlZIUThCQWY4RQpCQU1DQXFRd0R3WURWUjBUQVFIL0JBVXdBd0VCL3pBZEJnTlZIUTRFRmdRVUIxY1hJdTN6Yk91SEF0VXB6ZlpkCk9Cd1ozVXd3Q2dZSUtvWkl6ajBFQXdJRFNBQXdSUUloQUwwYUt1VnpDMlhPWVl0NUZ5WTRvMzVXb2FqNm5DN1cKRGcweFNtWUR5YUNPQWlBYjNoMlYrRmtUaVdDazRtWjZMY3dQZDU5OWcxaXZPQzVSNnhHanBZUlNOQT09Ci0tLS0tRU5EIENFUlRJRklDQVRFLS0tLS0K
            server: https://kubernetes.default.svc.cluster.local:443
            server: https://10.43.0.1:443
            #server: https://192.168.1.230:6443
          name: default
        contexts:
        - context:
            cluster: default
            user: default
          name: default
        current-context: default
        kind: Config
        preferences: {}
        users:
        - name: default
          user:
            client-certificate-data: LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUJrRENDQVRlZ0F3SUJBZ0lJUTQwU2hVMzI1bmd3Q2dZSUtvWkl6ajBFQXdJd0l6RWhNQjhHQTFVRUF3d1kKYXpOekxXTnNhV1Z1ZEMxallVQXhOakEyT0RBd01EazJNQjRYRFRJd01USXdNVEExTWpFek5sb1hEVEl4TVRJdwpNVEExTWpFek5sb3dNREVYTUJVR0ExVUVDaE1PYzNsemRHVnRPbTFoYzNSbGNuTXhGVEFUQmdOVkJBTVRESE41CmMzUmxiVHBoWkcxcGJqQlpNQk1HQnlxR1NNNDlBZ0VHQ0NxR1NNNDlBd0VIQTBJQUJJeVpKK0dVbERtVHFZOFgKKzA4UysvWTUrcjdaMENqV1pDWURhR0Z3dURJNGJoKzVmbGZ6YXZWWmt2NGhUTVU5eVRsN2RZRm9HS0l4TXlKNwpNNFppVWZpalNEQkdNQTRHQTFVZER3RUIvd1FFQXdJRm9EQVRCZ05WSFNVRUREQUtCZ2dyQmdFRkJRY0RBakFmCkJnTlZIU01FR0RBV2dCUUhQcVBwZGNhZUk4NU9idHZiRUNZLzB2RWVHakFLQmdncWhrak9QUVFEQWdOSEFEQkUKQWlBeURMZW81VUpPWXV5MXY1V2xrVERRMyt5RUhTcEhWWlAxUy9HZ1N5bkpQQUlnT2NxTkxyeEg3WlJYNWVITAphcjNHTkNwcjNoOHRZTENDUkpPVTVOcWJORXc9Ci0tLS0tRU5EIENFUlRJRklDQVRFLS0tLS0KLS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUJkakNDQVIyZ0F3SUJBZ0lCQURBS0JnZ3Foa2pPUFFRREFqQWpNU0V3SHdZRFZRUUREQmhyTTNNdFkyeHAKWlc1MExXTmhRREUyTURZNE1EQXdPVFl3SGhjTk1qQXhNakF4TURVeU1UTTJXaGNOTXpBeE1USTVNRFV5TVRNMgpXakFqTVNFd0h3WURWUVFEREJock0zTXRZMnhwWlc1MExXTmhRREUyTURZNE1EQXdPVFl3V1RBVEJnY3Foa2pPClBRSUJCZ2dxaGtqT1BRTUJCd05DQUFRRU9vVWV0SDRqUlBQbTNRSTVNZEJOcy83dCtROUdObklsZDRGU2xEWVQKcDBiS0wwK2hQNk5TT1FvdGxPemQ1Uk9qeGFZTzJIRXdMQTVrQzBJa2IxK2xvMEl3UURBT0JnTlZIUThCQWY4RQpCQU1DQXFRd0R3WURWUjBUQVFIL0JBVXdBd0VCL3pBZEJnTlZIUTRFRmdRVUJ6Nmo2WFhHbmlQT1RtN2IyeEFtClA5THhIaG93Q2dZSUtvWkl6ajBFQXdJRFJ3QXdSQUlnWFlmT0Q5V1ZFQ1IvNS9jSUFJaUs1emJ3T1lIbFgyR2wKT1I1UGdMdTVRTmtDSUR0N1NhSUM3MGIrUkU0YVBYNHdQb21RdklZUWtncE9BYkpZYW9oWTU3YnoKLS0tLS1FTkQgQ0VSVElGSUNBVEUtLS0tLQo=
            client-key-data: {{ pillar['cuttlefish']['kubectl-client-key-data'] }}

{% import 'lib/samba.sls' as samba with context %}
{{ samba.mount_share("samba.networking.svc.cluster.local", "audio", "cuttlefish", "david", pillar['cuttlefish']['samba-password']) }}
{{ samba.mount_share("samba.networking.svc.cluster.local", "documents", "cuttlefish", "david", pillar['cuttlefish']['samba-password']) }}
{{ samba.mount_share("samba.networking.svc.cluster.local", "games", "cuttlefish", "david", pillar['cuttlefish']['samba-password']) }}
{{ samba.mount_share("samba.networking.svc.cluster.local", "movies", "cuttlefish", "david", pillar['cuttlefish']['samba-password']) }}
{{ samba.mount_share("samba.networking.svc.cluster.local", "tv", "cuttlefish", "david", pillar['cuttlefish']['samba-password']) }}
