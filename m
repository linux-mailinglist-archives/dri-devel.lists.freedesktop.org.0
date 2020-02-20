Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE1A1669F4
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 22:37:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F6BA6EE72;
	Thu, 20 Feb 2020 21:37:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4784C6EE72
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 21:37:33 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id v2so5080955qkj.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 13:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AYj5LNpCUCCnBa2oy1JmbMYUv7Pxu05SUX364TAcUFQ=;
 b=D531YR+wxORn5yMqquYHuw0LOWJwbMGqJ/HNHEyXBvdaX61mb84C66r8YuwEn3FbWt
 B/4c623opxfVqQ+1xjlyGZUz1cj4ayk53VLlmQwfrriCzxb33kj2nNxvYuk1dMe2nX61
 l3AU+Tji7SjC591I2p8T9VMcXTtwLNlxZBdUZzHGQQRX0OIgYU0bKXkGmYdNWOFO3DSi
 n6lUEqkPx+kB698msH6xwbOr0YZFMTxcQGTpEqDjyHB4k6ZX2WksZV05JoWvHdAbMvuq
 spgfJOviI3N/k8F6SjsJ5Jq4wq3N7rNdG4rv0BPhG2hNi+8F2rSq252ySBXhEcw7BNvt
 YtiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AYj5LNpCUCCnBa2oy1JmbMYUv7Pxu05SUX364TAcUFQ=;
 b=TTYjE5knSNOYiqZW+DDZj98IpRhH4rXm9baQrrnvv3wy1KFJJFBvgnJZbm+ExRFXNG
 I0JtXjuhRvO8E0n4LZM648K/M2JjQsQ8UqkedOalchSrE9icR3SfKN+tqAwShvfv+rF6
 vrQgWHMN3joJRUOWBHHWYfeME15n5CH11H5Hwa3+vP51iIhE8GyqB/hHsaEBptMEBJP+
 +Zlcl521qQDjX83iLE1nfZv0Ei9RgR7mgDbaidgSYssmU0fneucHWuUcK7wwu199pryv
 rCHxSzOaR+1291Kx8KljAEuj6te0mmfdRqWtac9DdadYqcTsffXnlT4RChlWiOVqykHw
 poQg==
X-Gm-Message-State: APjAAAWavb1xcRdIsV13+qT6HvtWfDWZ7ILFf9vZKs5tPBKa6ig1W8pn
 f66duBQh/Ympe0z6bOIhbK8ZKwobRJlg1ri4V5o=
X-Google-Smtp-Source: APXvYqwplzoe4CvRRPMOeVSyg+GmZ7Xr+hoa90z86t8lCC8IWOl3oqq6wqqyXavOdlPzo69TGu/dWGFBrsXKgjK6BPo=
X-Received: by 2002:a37:a581:: with SMTP id
 o123mr28961726qke.131.1582234652483; 
 Thu, 20 Feb 2020 13:37:32 -0800 (PST)
MIME-Version: 1.0
References: <20200220083508.792071-1-anarsoul@gmail.com>
 <20200220083508.792071-4-anarsoul@gmail.com>
 <20200220135608.GE4998@pendragon.ideasonboard.com>
In-Reply-To: <20200220135608.GE4998@pendragon.ideasonboard.com>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Thu, 20 Feb 2020 13:37:19 -0800
Message-ID: <CA+E=qVeYUgPZMxmp5oHu1W8LYYqaJfEK6=L-3wadG6s-a2NPEw@mail.gmail.com>
Subject: Re: [PATCH 3/6] dt-bindings: Add Guangdong Neweast Optoelectronics
 CO. LTD vendor prefix
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Samuel Holland <samuel@sholland.org>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.io>,
 Stephan Gerhold <stephan@gerhold.net>, Jonas Karlman <jonas@kwiboo.se>,
 Torsten Duwe <duwe@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>,
 arm-linux <linux-arm-kernel@lists.infradead.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 linux-kernel <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 20, 2020 at 5:56 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Vasily,

Hi Laurent,

> Thank you for the patch.
>
> On Thu, Feb 20, 2020 at 12:35:05AM -0800, Vasily Khoruzhick wrote:
> > Add vendor prefix for Guangdong Neweast Optoelectronics CO. LTD
> >
> > Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > index 6456a6dfd83d..a390a793422b 100644
> > --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > @@ -665,6 +665,8 @@ patternProperties:
> >      description: Nexbox
> >    "^nextthing,.*":
> >      description: Next Thing Co.
> > +  "^neweast,.*":
> > +    description: Guangdong Neweast Optoelectronics CO., LT
>
> Google only returns two hits for this name, beside the ones related to
> this patch series. Are you sure this is the correct company name ?

That is what datasheet says:

http://files.pine64.org/doc/datasheet/pinebook/11.6inches-1080P-IPS-LCD-Panel-spec-WJFH116008A.pdf



> >    "^newhaven,.*":
> >      description: Newhaven Display International
> >    "^ni,.*":
>
> --
> Regards,
>
> Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
