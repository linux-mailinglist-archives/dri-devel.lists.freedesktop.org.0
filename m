Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C86DF56CD50
	for <lists+dri-devel@lfdr.de>; Sun, 10 Jul 2022 08:20:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4704A10F70A;
	Sun, 10 Jul 2022 06:19:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9C1710F70A
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jul 2022 06:19:55 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id e28so397804lfj.4
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Jul 2022 23:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vbb2/PT1SrDZAxpq6+5KNd0DS/ecDnYeh7++nJDXMnw=;
 b=NW+l4nvxSHDxsdCP/GpJ5TbKzSlnKmbiwyk+Qxc82DMs8viLK24g8EkvxRs+Rmoxut
 IUfuJj/O8opdN8Tg9r+aGg1bO9R+tFOYFAY3RUiEs3r9Nc7mgl+gjPAmiSfAGdXlI1h4
 XCsOMdVvrJ7mNY+0mAzcKfSSyBQ35DSaug8dxWs38KtbFvF+4UYQwikVQf2IvN6uT2co
 hluITcpET3AMSYAABhoNlV4bZEE97i5CLJUaz3wxJl0T/U0HTTLbDUhRm2xad+ReODs/
 G/I4H/2oJuLv6RGBjEtO1/5r16AJf2o01JyBbgmWrZMDFkqOB0hcnCi8wFn6pmhiQ4gj
 Wypg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vbb2/PT1SrDZAxpq6+5KNd0DS/ecDnYeh7++nJDXMnw=;
 b=J9+6dVxFvi7y9+wgDvt36gsbe5ZEiT+loWeaxiVbBQbEliYcwSF0igjtzYniotY/n8
 QeawxVEegMwvJ7MhGnuJIDCupAAlmQYGD1P9BaqtAlYGm7jaaP5EeVNEo6T+n/nwAP36
 h0jOHHbd/g12vBTb+yIh0hX03+V4GKZ4GWj7R0e70Xyp+e0ALWd8vjMGJa/jsyxeG3hF
 HBjr/TUjAKTA2o3FT4+/JrtTHHNqKQ9JcOux/wVMtGSlSeRIs+y0NIGD3OYN972cZTsv
 u7YVzm4qRUwUXpYx01yytAlulkio5MjnHyQaeTLFkcSvg0qJK82Wv3kamVuN/DoyKTDr
 8bpw==
X-Gm-Message-State: AJIora98nIKHTgAu9GiVMGcC0eM37aEy4OhBa1Ko79f8YfRE5TS2nNCZ
 IBashZmMlN83+2QfMZFcGtbmjkliNcQ8YemFJfk=
X-Google-Smtp-Source: AGRyM1vfw3Qw3P7MAW10abF+r0XyVAYvuTgyOqqKICIFkZH5tjdzJbpEhBcOpAnhGmcnyjNHR2KfFukPkPX7PmsDpSM=
X-Received: by 2002:ac2:54a2:0:b0:489:57b0:7adc with SMTP id
 w2-20020ac254a2000000b0048957b07adcmr7926478lfk.271.1657433993866; Sat, 09
 Jul 2022 23:19:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220709141136.58298-1-mollysophia379@gmail.com>
 <YsnpXU2w1wsXiGrs@ravnborg.org>
In-Reply-To: <YsnpXU2w1wsXiGrs@ravnborg.org>
From: Molly Sophia <mollysophia379@gmail.com>
Date: Sun, 10 Jul 2022 14:19:41 +0800
Message-ID: <CAK0UmJBL9tj+XLa3GQHqk_gMHz9tZRoWEj=3G9zjNaPkZw9+5A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: panel: Add Novatek NT35596S
 panel bindings
To: Sam Ravnborg <sam@ravnborg.org>
Content-Type: multipart/alternative; boundary="00000000000071727805e36d6c52"
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 phone-devel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--00000000000071727805e36d6c52
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sam,

Thanks for your suggestions.

Sam Ravnborg <sam@ravnborg.org> =E4=BA=8E 2022=E5=B9=B47=E6=9C=8810=E6=97=
=A5=E5=91=A8=E6=97=A5 =E4=B8=8A=E5=8D=884:47=E5=86=99=E9=81=93=EF=BC=9A

> Hi Molly,
>
> thanks for the quick response to the review comments.
>
> On Sat, Jul 09, 2022 at 10:11:35PM +0800, MollySophia wrote:
> > Add documentation for "novatek,nt35596s" panel.
> >
> > Signed-off-by: MollySophia <mollysophia379@gmail.com>
> The s-o-b needs your real name - guess the above is a concatenation of
> first name and surname.
>
> The binding included in this patch fails the check:
> $ make DT_CHECKER_FLAGS=3D-m dt_binding_check
>
> You may need to run:
> $ pip3 install dtschema --upgrade
>
> Or you may have to install some dependencies first.
> The problem is that the patch is missing a "reset-gpios: true"
>
> On top of this I looked at the binding - and the description
> this is copied from is almost identical.
> So another approach would be to extend the existing binding like
> in the following.
>
> And this also gives a good hint that maybe this can be embedded in
> the existing driver - and there is no need for a new driver.
> Could you try to give this a spin and get back on this.
>

That's reasonable. Actually, this driver was modified from
novatek,nt35596s, with different panel initialization commands, and it
seems easy to be embedded in
the existing driver. However, I wonder what the driver file name would
be...? "panel-novatek-nt35596s-nt36672a.c" or something else?

        Molly

Sorry for not seeing this in the first place.
>
>         Sam
>
> diff --git
> a/Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml
> b/Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml
> index 41ee3157a1cd..913bb81ae93d 100644
> --- a/Documentation/devicetree/bindings/display/panel/novatek,nt36672a.ya=
ml
> +++ b/Documentation/devicetree/bindings/display/panel/novatek,nt36672a.ya=
ml
> @@ -20,14 +20,20 @@ allOf:
>
>  properties:
>    compatible:
> -    items:
> -      - enum:
> -          - tianma,fhd-video
> -      - const: novatek,nt36672a
> +    oneOf:
> +      - items:
> +          - enum:
> +              - tianma,fhd-video
> +          - const: novatek,nt36672a
> +
> +      - items:
> +          - enum:
> +              - jdi,fhd-nt35596s
> +          - const: novatek,nt35596s
> +
>      description: This indicates the panel manufacturer of the panel that
> is
> -      in turn using the NT36672A panel driver. This compatible string
> -      determines how the NT36672A panel driver is configured for the
> indicated
> -      panel. The novatek,nt36672a compatible shall always be provided as
> a fallback.
> +       in turn using the NT36672A or the NT35596S panel driver. This
> compatible string
> +       determines how the panel driver is configured for the indicated
> panel.
>
>    reset-gpios:
>      maxItems: 1
> @@ -85,4 +91,27 @@ examples:
>          };
>      };
>
> +    dsi1 {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        panel@0 {
> +            compatible =3D "jdi,fhd-nt35596s", "novatek,nt35596s";
> +            reg =3D <0>;
> +            vddi0-supply =3D <&vreg_l14a_1p88>;
> +            vddpos-supply =3D <&lab>;
> +            vddneg-supply =3D <&ibb>;
> +
> +            backlight =3D <&pmi8998_wled>;
> +            reset-gpios =3D <&tlmm 6 GPIO_ACTIVE_HIGH>;
> +
> +            port {
> +                jdi_nt35596s_in_1: endpoint {
> +                    remote-endpoint =3D <&dsi1_out>;
> +                };
> +            };
> +        };
> +    };
> +
> +
>  ...
>
> > ---
> >  .../display/panel/novatek,nt35596s.yaml       | 83 +++++++++++++++++++
> >  1 file changed, 83 insertions(+)
> >  create mode 100644
> Documentation/devicetree/bindings/display/panel/novatek,nt35596s.yaml
> >
> > diff --git
> a/Documentation/devicetree/bindings/display/panel/novatek,nt35596s.yaml
> b/Documentation/devicetree/bindings/display/panel/novatek,nt35596s.yaml
> > new file mode 100644
> > index 000000000000..f724f101a6fd
> > --- /dev/null
> > +++
> b/Documentation/devicetree/bindings/display/panel/novatek,nt35596s.yaml
> > @@ -0,0 +1,83 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/panel/novatek,nt35596s.yaml=
#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Novatek NT35596S based DSI display Panels
> > +
> > +maintainers:
> > +  - Molly Sophia <mollysophia379@gmail.com>
> > +
> > +description: |
> > +  The nt35596s IC from Novatek is a generic DSI Panel IC used to drive
> dsi
> > +  panels.
> > +  Right now, support is added only for a JDI FHD+ LCD display panel
> with a
> > +  resolution of 1080x2160. It is a video mode DSI panel.
> > +
> > +allOf:
> > +  - $ref: panel-common.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - jdi,fhd-nt35596s
> > +      - const: novatek,nt35596s
> > +    description: This indicates the panel manufacturer of the panel
> that is
> > +      in turn using the NT35596S panel driver. This compatible string
> > +      determines how the NT35596S panel driver is configured for the
> indicated
> > +      panel. The novatek,nt35596s compatible shall always be provided
> as a fallback.
> > +
> > +  vddi0-supply:
> > +    description: regulator that provides the supply voltage
> > +      Power IC supply
> > +
> > +  vddpos-supply:
> > +    description: positive boost supply regulator
> > +
> > +  vddneg-supply:
> > +    description: negative boost supply regulator
> > +
> > +  reg: true
> > +  port: true
> > +  backlight: true
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - vddi0-supply
> > +  - vddpos-supply
> > +  - vddneg-supply
> > +  - reset-gpios
> > +  - port
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    dsi {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        panel@0 {
> > +            compatible =3D "jdi,fhd-nt35596s", "novatek,nt35596s";
> > +            reg =3D <0>;
> > +            vddi0-supply =3D <&vreg_l14a_1p88>;
> > +            vddpos-supply =3D <&lab>;
> > +            vddneg-supply =3D <&ibb>;
> > +
> > +            backlight =3D <&pmi8998_wled>;
> > +            reset-gpios =3D <&tlmm 6 GPIO_ACTIVE_HIGH>;
> > +
> > +            port {
> > +                jdi_nt35596s_in_0: endpoint {
> > +                    remote-endpoint =3D <&dsi0_out>;
> > +                };
> > +            };
> > +        };
> > +    };
> > +
> > +...
> > --
> > 2.37.0
>

--00000000000071727805e36d6c52
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div style=3D"font-size:12.8px" dir=3D"auto">Hi Sam,=
</div><div style=3D"font-size:12.8px" dir=3D"auto"><br></div><div style=3D"=
font-size:12.8px" dir=3D"auto">Thanks for your suggestions.</div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Sam Ravnborg &lt=
;<a href=3D"mailto:sam@ravnborg.org" target=3D"_blank" rel=3D"noreferrer">s=
am@ravnborg.org</a>&gt; =E4=BA=8E 2022=E5=B9=B47=E6=9C=8810=E6=97=A5=E5=91=
=A8=E6=97=A5 =E4=B8=8A=E5=8D=884:47=E5=86=99=E9=81=93=EF=BC=9A<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">Hi Molly,<br>
<br>
thanks for the quick response to the review comments.<br>
<br>
On Sat, Jul 09, 2022 at 10:11:35PM +0800, MollySophia wrote:<br>
&gt; Add documentation for &quot;novatek,nt35596s&quot; panel.<br>
&gt; <br>
&gt; Signed-off-by: MollySophia &lt;<a href=3D"mailto:mollysophia379@gmail.=
com" rel=3D"noreferrer noreferrer" target=3D"_blank">mollysophia379@gmail.c=
om</a>&gt;<br>
The s-o-b needs your real name - guess the above is a concatenation of<br>
first name and surname.<br>
<br>
The binding included in this patch fails the check:<br>
$ make DT_CHECKER_FLAGS=3D-m dt_binding_check<br>
<br>
You may need to run:<br>
$ pip3 install dtschema --upgrade<br>
<br>
Or you may have to install some dependencies first.<br>
The problem is that the patch is missing a &quot;reset-gpios: true&quot;<br=
>
<br>
On top of this I looked at the binding - and the description<br>
this is copied from is almost identical.<br>
So another approach would be to extend the existing binding like<br>
in the following.<br>
<br>
And this also gives a good hint that maybe this can be embedded in<br>
the existing driver - and there is no need for a new driver.<br>
Could you try to give this a spin and get back on this.<br></blockquote></d=
iv></div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_=
quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex"></blockquote></div></div><div dir=3D"=
auto"><div style=3D"font-size:12.8px" dir=3D"auto"><div>That&#39;s reasonab=
le. Actually, this driver was modified from novatek,nt35596s, with differen=
t panel initialization commands, and it seems easy to be embedded in</div>t=
he existing driver. However, I wonder what the driver file name would be...=
? &quot;panel-novatek-nt35596s-nt36672a.c&quot; or something else?</div><di=
v style=3D"color:rgb(136,136,136);font-size:12.8px" dir=3D"auto"><div><br><=
/div></div><div style=3D"font-size:12.8px" dir=3D"auto"><div style=3D"color=
:rgb(136,136,136)">=C2=A0 =C2=A0 =C2=A0 =C2=A0 Molly</div><div style=3D"col=
or:rgb(136,136,136)" dir=3D"auto"><br></div></div></div><div dir=3D"auto"><=
div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
Sorry for not seeing this in the first place.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Sam<br>
<br>
diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt3667=
2a.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt36672a.=
yaml<br>
index 41ee3157a1cd..913bb81ae93d 100644<br>
--- a/Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml=
<br>
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml=
<br>
@@ -20,14 +20,20 @@ allOf:<br>
<br>
=C2=A0properties:<br>
=C2=A0 =C2=A0compatible:<br>
-=C2=A0 =C2=A0 items:<br>
-=C2=A0 =C2=A0 =C2=A0 - enum:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - tianma,fhd-video<br>
-=C2=A0 =C2=A0 =C2=A0 - const: novatek,nt36672a<br>
+=C2=A0 =C2=A0 oneOf:<br>
+=C2=A0 =C2=A0 =C2=A0 - items:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - enum:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - tianma,fhd-video<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - const: novatek,nt36672a<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 - items:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - enum:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - jdi,fhd-nt35596s<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - const: novatek,nt35596s<br>
+<br>
=C2=A0 =C2=A0 =C2=A0description: This indicates the panel manufacturer of t=
he panel that is<br>
-=C2=A0 =C2=A0 =C2=A0 in turn using the NT36672A panel driver. This compati=
ble string<br>
-=C2=A0 =C2=A0 =C2=A0 determines how the NT36672A panel driver is configure=
d for the indicated<br>
-=C2=A0 =C2=A0 =C2=A0 panel. The novatek,nt36672a compatible shall always b=
e provided as a fallback.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0in turn using the NT36672A or the NT35596S pane=
l driver. This compatible string<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0determines how the panel driver is configured f=
or the indicated panel.<br>
<br>
=C2=A0 =C2=A0reset-gpios:<br>
=C2=A0 =C2=A0 =C2=A0maxItems: 1<br>
@@ -85,4 +91,27 @@ examples:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
=C2=A0 =C2=A0 =C2=A0};<br>
<br>
+=C2=A0 =C2=A0 dsi1 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 #address-cells =3D &lt;1&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 #size-cells =3D &lt;0&gt;;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel@0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D &quot;jdi,fhd-nt3=
5596s&quot;, &quot;novatek,nt35596s&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;0&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vddi0-supply =3D &lt;&amp;vreg_l=
14a_1p88&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vddpos-supply =3D &lt;&amp;lab&g=
t;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vddneg-supply =3D &lt;&amp;ibb&g=
t;;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 backlight =3D &lt;&amp;pmi8998_w=
led&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reset-gpios =3D &lt;&amp;tlmm 6 =
GPIO_ACTIVE_HIGH&gt;;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 port {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 jdi_nt35596s_in_1:=
 endpoint {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 remo=
te-endpoint =3D &lt;&amp;dsi1_out&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
+=C2=A0 =C2=A0 };<br>
+<br>
+<br>
=C2=A0...<br>
<br>
&gt; ---<br>
&gt;=C2=A0 .../display/panel/novatek,nt35596s.yaml=C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 83 +++++++++++++++++++<br>
&gt;=C2=A0 1 file changed, 83 insertions(+)<br>
&gt;=C2=A0 create mode 100644 Documentation/devicetree/bindings/display/pan=
el/novatek,nt35596s.yaml<br>
&gt; <br>
&gt; diff --git a/Documentation/devicetree/bindings/display/panel/novatek,n=
t35596s.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt35=
596s.yaml<br>
&gt; new file mode 100644<br>
&gt; index 000000000000..f724f101a6fd<br>
&gt; --- /dev/null<br>
&gt; +++ b/Documentation/devicetree/bindings/display/panel/novatek,nt35596s=
.yaml<br>
&gt; @@ -0,0 +1,83 @@<br>
&gt; +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause<br>
&gt; +%YAML 1.2<br>
&gt; +---<br>
&gt; +$id: <a href=3D"http://devicetree.org/schemas/display/panel/novatek,n=
t35596s.yaml#" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">h=
ttp://devicetree.org/schemas/display/panel/novatek,nt35596s.yaml#</a><br>
&gt; +$schema: <a href=3D"http://devicetree.org/meta-schemas/core.yaml#" re=
l=3D"noreferrer noreferrer noreferrer" target=3D"_blank">http://devicetree.=
org/meta-schemas/core.yaml#</a><br>
&gt; +<br>
&gt; +title: Novatek NT35596S based DSI display Panels<br>
&gt; +<br>
&gt; +maintainers:<br>
&gt; +=C2=A0 - Molly Sophia &lt;<a href=3D"mailto:mollysophia379@gmail.com"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">mollysophia379@gmail.com</=
a>&gt;<br>
&gt; +<br>
&gt; +description: |<br>
&gt; +=C2=A0 The nt35596s IC from Novatek is a generic DSI Panel IC used to=
 drive dsi<br>
&gt; +=C2=A0 panels.<br>
&gt; +=C2=A0 Right now, support is added only for a JDI FHD+ LCD display pa=
nel with a<br>
&gt; +=C2=A0 resolution of 1080x2160. It is a video mode DSI panel.<br>
&gt; +<br>
&gt; +allOf:<br>
&gt; +=C2=A0 - $ref: panel-common.yaml#<br>
&gt; +<br>
&gt; +properties:<br>
&gt; +=C2=A0 compatible:<br>
&gt; +=C2=A0 =C2=A0 items:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 - enum:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - jdi,fhd-nt35596s<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 - const: novatek,nt35596s<br>
&gt; +=C2=A0 =C2=A0 description: This indicates the panel manufacturer of t=
he panel that is<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 in turn using the NT35596S panel driver. This co=
mpatible string<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 determines how the NT35596S panel driver is conf=
igured for the indicated<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 panel. The novatek,nt35596s compatible shall alw=
ays be provided as a fallback.<br>
&gt; +<br>
&gt; +=C2=A0 vddi0-supply:<br>
&gt; +=C2=A0 =C2=A0 description: regulator that provides the supply voltage=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 Power IC supply<br>
&gt; +<br>
&gt; +=C2=A0 vddpos-supply:<br>
&gt; +=C2=A0 =C2=A0 description: positive boost supply regulator<br>
&gt; +<br>
&gt; +=C2=A0 vddneg-supply:<br>
&gt; +=C2=A0 =C2=A0 description: negative boost supply regulator<br>
&gt; +<br>
&gt; +=C2=A0 reg: true<br>
&gt; +=C2=A0 port: true<br>
&gt; +=C2=A0 backlight: true<br>
&gt; +<br>
&gt; +required:<br>
&gt; +=C2=A0 - compatible<br>
&gt; +=C2=A0 - reg<br>
&gt; +=C2=A0 - vddi0-supply<br>
&gt; +=C2=A0 - vddpos-supply<br>
&gt; +=C2=A0 - vddneg-supply<br>
&gt; +=C2=A0 - reset-gpios<br>
&gt; +=C2=A0 - port<br>
&gt; +<br>
&gt; +additionalProperties: false<br>
&gt; +<br>
&gt; +examples:<br>
&gt; +=C2=A0 - |<br>
&gt; +=C2=A0 =C2=A0 #include &lt;dt-bindings/gpio/gpio.h&gt;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 dsi {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 #address-cells =3D &lt;1&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 #size-cells =3D &lt;0&gt;;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel@0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D &quot;jdi,fh=
d-nt35596s&quot;, &quot;novatek,nt35596s&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;0&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vddi0-supply =3D &lt;&amp;v=
reg_l14a_1p88&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vddpos-supply =3D &lt;&amp;=
lab&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vddneg-supply =3D &lt;&amp;=
ibb&gt;;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 backlight =3D &lt;&amp;pmi8=
998_wled&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reset-gpios =3D &lt;&amp;tl=
mm 6 GPIO_ACTIVE_HIGH&gt;;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 port {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 jdi_nt35596s_=
in_0: endpoint {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 remote-endpoint =3D &lt;&amp;dsi0_out&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
&gt; +=C2=A0 =C2=A0 };<br>
&gt; +<br>
&gt; +...<br>
&gt; -- <br>
&gt; 2.37.0<br>
</blockquote></div></div></div>

--00000000000071727805e36d6c52--
