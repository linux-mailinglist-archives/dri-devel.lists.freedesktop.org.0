Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EBA656D46E
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 07:57:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69FB911B78F;
	Mon, 11 Jul 2022 05:57:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54DB711B78F
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 05:57:39 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id eq6so4942931edb.6
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jul 2022 22:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y6RCo6UAYirBZIpVxNvEH2MQEv9bZ3Sc08DOYjtief4=;
 b=jLxzEaMT2OOek1MKUlI5+W3Rhe801Rd5SlTLuyBaGF+ls2k1Tohs8nQoD8IIsTEvw9
 itlUFA8mDy8jAu9mvKxS8hsKbHO0D/m5WLyLgAISXxPkET8QoQVYWTygP5otofUcBPOo
 BvmFqn+kmZuCpmxSt2Z838oW5LvOUffD1EniI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y6RCo6UAYirBZIpVxNvEH2MQEv9bZ3Sc08DOYjtief4=;
 b=I1Jwgm6vkvXU0qiGStDJs0ruSOR3YJrHrDhHS3LcQdAxcHzVOLZU4MCgy1VMIq+N3B
 JqMvr8GFoE/tBkc9krHLYJOuGTFksx+ZimUoSwJyI5X24YGdw1CxJMHxNHrHZDnwlzz+
 RFbj1toKoDPLqXbKiC7Wf8f/gJqCCm2j1DFwMttdXZP/YMUdqy9oS3n4lruGqEdAEbPs
 GEcYeMjYAvRLMj9jzkObQprhfIvshdanI99iSdtPcWPPXwqkGa+5DsTW4Fe6fVgSIT34
 9rCAmi9s1p+1au4Z70uVvsj7G7PNRfXCerG8n4c+JtHacn0PfRGXsGQJHaFYMAybYpt5
 +d3w==
X-Gm-Message-State: AJIora/AiWKG8FwDkGNDAQwYAhnioaKYbqCpA+6a05zRweaCMNj481H1
 W0HTtb/UF+0HcdaBXBGGSpUc2aZ2dR385e0Yz87hHA==
X-Google-Smtp-Source: AGRyM1s1qd8zLo3iJQ+TYZWTtRZVf8nY0fBSS0EONNoEooU/rPcfCp26yJtxsoIUYS/Q6fBPcMLQeqv72mJtE0Pz2Qk=
X-Received: by 2002:a05:6402:2b88:b0:43a:6c58:6c64 with SMTP id
 fj8-20020a0564022b8800b0043a6c586c64mr23150704edb.348.1657519057799; Sun, 10
 Jul 2022 22:57:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220615093900.344726-1-sunil@amarulasolutions.com>
 <20220615093900.344726-2-sunil@amarulasolutions.com>
 <e65211d3-110b-3f25-57b7-6f65c45cf9ea@sholland.org>
In-Reply-To: <e65211d3-110b-3f25-57b7-6f65c45cf9ea@sholland.org>
From: Suniel Mahesh <sunil@amarulasolutions.com>
Date: Mon, 11 Jul 2022 11:27:26 +0530
Message-ID: <CAM+7aWt1KUpVw0RB-iFUV_PWt1Vc9hfXOjj33vC_y9H3Tfbaig@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: sunxi: Add binding for
 RenewWorldOutReach R16-Vista-E board
To: Samuel Holland <samuel@sholland.org>
Content-Type: multipart/alternative; boundary="000000000000a61d2d05e3813a28"
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Christopher Vollo <chris@renewoutreach.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Mark Brown <broonie@kernel.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000a61d2d05e3813a28
Content-Type: text/plain; charset="UTF-8"

Hi Samuel,

On Sun, Jul 3, 2022 at 1:17 PM Samuel Holland <samuel@sholland.org> wrote:

> On 6/15/22 4:38 AM, Suniel Mahesh wrote:
> > Add a binding for the RenewWorldOutReach R16-Vista-E board based on
> > allwinner R16.
> >
> > Signed-off-by: Christopher Vollo <chris@renewoutreach.org>
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > Signed-off-by: Suniel Mahesh <sunil@amarulasolutions.com>
>
> The primary author of the commit (the From:) should be the first signer,
> unless
> you are using Co-developed-by:. See the examples here:
>
>
> https://www.kernel.org/doc/html/latest/process/submitting-patches.html#when-to-use-acked-by-cc-and-co-developed-by
>
> > ---
> > Changes for v2:
> > - Add missing compatible string
> > - insert missing signatures of contributors
> > ---
> >  Documentation/devicetree/bindings/arm/sunxi.yaml | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml
> b/Documentation/devicetree/bindings/arm/sunxi.yaml
> > index 95278a6a9a8e..52b8c9aba6f3 100644
> > --- a/Documentation/devicetree/bindings/arm/sunxi.yaml
> > +++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
> > @@ -787,6 +787,12 @@ properties:
> >            - const: allwinner,r7-tv-dongle
> >            - const: allwinner,sun5i-a10s
> >
> > +      - description: RenewWorldOutreach R16-Vista-E
> > +        items:
> > +          - const: renewworldoutreach,r16-vista-e
>
> This vendor prefix should be documented.
>

Thanks for the suggestions, sending a v3.

>
> Regards,
> Samuel
>
> > +          - const: allwinner,sun8i-r16
> > +          - const: allwinner,sun8i-a33
> > +
> >        - description: RerVision H3-DVK
> >          items:
> >            - const: rervision,h3-dvk
> >
>
>

--000000000000a61d2d05e3813a28
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Samuel,</div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Sun, Jul 3, 2022 at 1:17 PM Samuel Holla=
nd &lt;<a href=3D"mailto:samuel@sholland.org">samuel@sholland.org</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 6/15/22=
 4:38 AM, Suniel Mahesh wrote:<br>
&gt; Add a binding for the RenewWorldOutReach R16-Vista-E board based on<br=
>
&gt; allwinner R16.<br>
&gt; <br>
&gt; Signed-off-by: Christopher Vollo &lt;<a href=3D"mailto:chris@renewoutr=
each.org" target=3D"_blank">chris@renewoutreach.org</a>&gt;<br>
&gt; Signed-off-by: Jagan Teki &lt;<a href=3D"mailto:jagan@amarulasolutions=
.com" target=3D"_blank">jagan@amarulasolutions.com</a>&gt;<br>
&gt; Signed-off-by: Suniel Mahesh &lt;<a href=3D"mailto:sunil@amarulasoluti=
ons.com" target=3D"_blank">sunil@amarulasolutions.com</a>&gt;<br>
<br>
The primary author of the commit (the From:) should be the first signer, un=
less<br>
you are using Co-developed-by:. See the examples here:<br>
<br>
<a href=3D"https://www.kernel.org/doc/html/latest/process/submitting-patche=
s.html#when-to-use-acked-by-cc-and-co-developed-by" rel=3D"noreferrer" targ=
et=3D"_blank">https://www.kernel.org/doc/html/latest/process/submitting-pat=
ches.html#when-to-use-acked-by-cc-and-co-developed-by</a><br>
<br>
&gt; ---<br>
&gt; Changes for v2:<br>
&gt; - Add missing compatible string<br>
&gt; - insert missing signatures of contributors<br>
&gt; ---<br>
&gt;=C2=A0 Documentation/devicetree/bindings/arm/sunxi.yaml | 6 ++++++<br>
&gt;=C2=A0 1 file changed, 6 insertions(+)<br>
&gt; <br>
&gt; diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Docume=
ntation/devicetree/bindings/arm/sunxi.yaml<br>
&gt; index 95278a6a9a8e..52b8c9aba6f3 100644<br>
&gt; --- a/Documentation/devicetree/bindings/arm/sunxi.yaml<br>
&gt; +++ b/Documentation/devicetree/bindings/arm/sunxi.yaml<br>
&gt; @@ -787,6 +787,12 @@ properties:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - const: allwinner,r7-tv-dong=
le<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - const: allwinner,sun5i-a10s=
<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 =C2=A0 - description: RenewWorldOutreach R16-Vista-E<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 items:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - const: renewworldoutreach,r16-vi=
sta-e<br>
<br>
This vendor prefix should be documented.<br></blockquote><div><br></div><di=
v>Thanks for the suggestions, sending a v3.=C2=A0</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
<br>
Regards,<br>
Samuel<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - const: allwinner,sun8i-r16<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - const: allwinner,sun8i-a33<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 - description: RerVision H3-DVK<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 items:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - const: rervision,h3-dvk<br>
&gt; <br>
<br>
</blockquote></div></div>

--000000000000a61d2d05e3813a28--
