def format_follower_count(n):
    if n >= 1_000_000:
        formatted = f"{n / 1_000_000:.1f}M"
    elif n >= 1_000:
        formatted = f"{n / 1_000:.1f}K"
    else:
        return str(n)
    
    return formatted.replace(".0", "")