function show_tf(tf, t, f, elapsedTime, msg)
  % find norm and convert into 500x500 image 
  tf_norm = abs(tf');
  tf_norm = tf_norm / max(max(tf_norm)) * 255;
  
  % save into images
  h = figure;
  set(h, 'Visible', 'off'); % don't display the figure
  colormap(gray(256));
  image(t, f, tf_norm);
  set(gca,'YDir','normal');
  title([msg ', elapsed time = ' num2str(elapsedTime) 'sec, matrix size (time freq)= ' num2str(size(tf_norm'))]);
  xlabel('time (sec)');
  ylabel('frequency (Hz)');
  
  % save the figure as ".jpg"
  saveas(h, [msg '.fig']);
  saveas(h, [msg '.jpg']);
end