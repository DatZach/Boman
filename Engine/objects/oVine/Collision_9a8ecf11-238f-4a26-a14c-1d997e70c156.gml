/// @description  Set self aflame if mob is aflame

if (other.aflame)
    event_user(0);

if (aflame)
{
    with(other)
        event_user(1);
}

