function val = newton(f, fd, x0, tol)
    val = x0;

    preval = val - f(val)/fd(val);

    while true
        val = val - f(val)/fd(val);
        if abs(preval-val) < tol
            break
        end
        preval = val;
    end

end