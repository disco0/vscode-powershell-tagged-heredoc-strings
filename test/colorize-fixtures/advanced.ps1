#region Valid - xml

#region Valid - xml - @"

## form layout
[xml]$xaml = <# xml #> @"
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
	    xmlns:s='clr-namespace:System;assembly=mscorlib'
	    xmlns:l='clr-namespace:_treeListView;assembly=$([_treeListView.LevelToIndentConverter].Assembly)'
		Title="TreeListView" Width="640" Height="480">
    <Window.Resources>
    <Style x:Key="ExpandCollapseToggleStyle"
           TargetType="{x:Type ToggleButton}">
            <Setter Property="Focusable" Value="False"/>
            <Setter Property="Width" Value="19"/>
            <Setter Property="Height" Value="13"/>
            <Setter Property="Template">
                <Setter.Value>
                    <ControlTemplate TargetType="{x:Type ToggleButton}">
                        <Border Width="19" Height="13" Background="Transparent">
                            <Border Width="9" Height="9" BorderThickness="1" BorderBrush="#FF7898B5" CornerRadius="1" SnapsToDevicePixels="true">
                                <Border.Background>
                                    <LinearGradientBrush StartPoint="0,0" EndPoint="1,1">
                                        <LinearGradientBrush.GradientStops>
                                            <GradientStop Color="White" Offset=".2"/>
                                            <GradientStop Color="#FFC0B7A6" Offset="1"/>
                                        </LinearGradientBrush.GradientStops>
                                    </LinearGradientBrush>
                                </Border.Background>
                                <Path x:Name="ExpandPath" Margin="1,1,1,1" Fill="Black"
                                      Data="M 0 2 L 0 3 L 2 3 L 2 5 L 3 5 L 3 3 L 5 3 L 5 2 L 3 2 L 3 0 L 2 0 L 2 2 Z"/>
                            </Border>
                        </Border>
                        <ControlTemplate.Triggers>
                            <Trigger Property="IsChecked" Value="True">
                                <Setter Property="Data" TargetName="ExpandPath" Value="M 0 2 L 0 3 L 5 3 L 5 2 Z"/>
                            </Trigger>
                        </ControlTemplate.Triggers>
                    </ControlTemplate>
                </Setter.Value>
            </Setter>
        </Style>

        <l:LevelToIndentConverter x:Key="LevelToIndentConverter"/>

        <DataTemplate x:Key="CellTemplate_Name">
            <DockPanel>
                <ToggleButton x:Name="Expander"
                      Style="{StaticResource ExpandCollapseToggleStyle}"
                      Margin="{Binding Level, Converter={StaticResource LevelToIndentConverter},
                             RelativeSource={RelativeSource AncestorType={x:Type l:TreeListViewItem}}}"
                      IsChecked="{Binding Path=IsExpanded, RelativeSource=
                    {RelativeSource AncestorType={x:Type l:TreeListViewItem}}}"
                      ClickMode="Press"/>
                <TextBlock Text="{Binding Name}"/>
            </DockPanel>
            <DataTemplate.Triggers>
                <DataTrigger Binding="{Binding Path=HasItems,RelativeSource={RelativeSource AncestorType={x:Type l:TreeListViewItem}}}" Value="False">
                    <Setter TargetName="Expander" Property="Visibility" Value="Hidden"/>
                </DataTrigger>
            </DataTemplate.Triggers>
        </DataTemplate>

        <GridViewColumnCollection x:Key="gvcc">
            <GridViewColumn Header="Name" CellTemplate="{StaticResource CellTemplate_Name}" />
            <GridViewColumn Header="MemberType" DisplayMemberBinding="{Binding MemberType}" />
            <GridViewColumn Header="Definition" DisplayMemberBinding="{Binding Definition}" />
            <GridViewColumn Header="Value" DisplayMemberBinding="{Binding Value}" />
        </GridViewColumnCollection>

        <Style TargetType="{x:Type l:TreeListViewItem}">
            <Setter Property="Template">
                <Setter.Value>
                    <ControlTemplate TargetType="{x:Type l:TreeListViewItem}">
                        <StackPanel>
                            <Border Name="Bd"
                      Background="{TemplateBinding Background}"
                      BorderBrush="{TemplateBinding BorderBrush}"
                      BorderThickness="{TemplateBinding BorderThickness}"
                      Padding="{TemplateBinding Padding}">
                                <GridViewRowPresenter x:Name="PART_Header"
                                      Content="{TemplateBinding Header}"
                                      Columns="{StaticResource gvcc}" />
                            </Border>
                            <ItemsPresenter x:Name="ItemsHost" />
                        </StackPanel>
                        <ControlTemplate.Triggers>
                            <Trigger Property="IsExpanded" Value="false">
                                <Setter TargetName="ItemsHost" Property="Visibility" Value="Collapsed"/>
                            </Trigger>
                            <MultiTrigger>
                                <MultiTrigger.Conditions>
                                    <Condition Property="HasHeader" Value="false"/>
                                    <Condition Property="Width" Value="Auto"/>
                                </MultiTrigger.Conditions>
                                <Setter TargetName="PART_Header" Property="MinWidth" Value="75"/>
                            </MultiTrigger>
                            <MultiTrigger>
                                <MultiTrigger.Conditions>
                                    <Condition Property="HasHeader" Value="false"/>
                                    <Condition Property="Height" Value="Auto"/>
                                </MultiTrigger.Conditions>
                                <Setter TargetName="PART_Header" Property="MinHeight" Value="19"/>
                            </MultiTrigger>
                            <Trigger Property="IsSelected" Value="true">
                                <Setter TargetName="Bd" Property="Background" Value="{DynamicResource {x:Static SystemColors.HighlightBrushKey}}"/>
                                <Setter Property="Foreground" Value="{DynamicResource {x:Static SystemColors.HighlightTextBrushKey}}"/>
                            </Trigger>
                            <MultiTrigger>
                                <MultiTrigger.Conditions>
                                    <Condition Property="IsSelected" Value="true"/>
                                    <Condition Property="IsSelectionActive" Value="false"/>
                                </MultiTrigger.Conditions>
                                <Setter TargetName="Bd" Property="Background" Value="{DynamicResource  {x:Static SystemColors.ControlBrushKey}}"/>
                                <Setter Property="Foreground" Value="{DynamicResource {x:Static SystemColors.ControlTextBrushKey}}"/>
                            </MultiTrigger>
                            <Trigger Property="IsEnabled" Value="false">
                                <Setter Property="Foreground" Value="{DynamicResource {x:Static SystemColors.GrayTextBrushKey}}"/>
                            </Trigger>
                        </ControlTemplate.Triggers>
                    </ControlTemplate>
                </Setter.Value>
            </Setter>
        </Style>

        <Style TargetType="{x:Type l:TreeListView}">
            <Setter Property="Template">
                <Setter.Value>
                    <ControlTemplate TargetType="{x:Type l:TreeListView}">
                        <Border BorderBrush="{TemplateBinding BorderBrush}" BorderThickness="{TemplateBinding BorderThickness}">
                            <DockPanel>
                                <GridViewHeaderRowPresenter Columns="{StaticResource gvcc}" DockPanel.Dock="Top"/>
                                <ScrollViewer CanContentScroll="True">
                                    <Grid>
                                    <ItemsPresenter/>
                                    </Grid>
                                </ScrollViewer>
                            </DockPanel>
                        </Border>
                    </ControlTemplate>
                </Setter.Value>
            </Setter>
        </Style>
    </Window.Resources>
    <l:TreeListView x:Name="Tlv"/>
</Window>

"@

#endregion Valid - xml - @"

#endregion Valid - xml