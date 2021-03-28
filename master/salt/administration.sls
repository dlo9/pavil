# https://wiki.manjaro.org/index.php/Swap#Creating_and_Enabling_a_Swap_Partition
{% import 'lib/swap.sls' as swap with context %}
{{ swap.enable_swap_partition('/dev/sda3') }}
