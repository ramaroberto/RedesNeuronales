function [] = makeGridGraphic( weights, dataset, epocs, M1, M2)

    

    w1 = vec2mat(weights(1,:),M1,M2);
    w2 = vec2mat(weights(2,:),M1,M2);

    figure(1)
    plot(dataset(:,1),dataset(:,2),'.b')
    hold on
    plot(w1,w2,'or')
    plot(w1,w2,'k','linewidth',2)
    plot(w1',w2','k','linewidth',2)
    hold off
    title(['t=' num2str(epocs)]);
    drawnow
end

