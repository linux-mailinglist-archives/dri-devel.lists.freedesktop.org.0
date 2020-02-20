Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 130721669ED
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 22:37:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 126B16EE69;
	Thu, 20 Feb 2020 21:37:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 814946EE69
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 21:37:00 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id d9so4006957qte.12
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 13:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WBuh5ANX049XvoAuYc6kDkKQiW67h+g1q8TDSOz1dqU=;
 b=gGDChIYPb7jifbHXTNEr728+h/KDQM6oZ7iVOorsQNIlKeVpq2/SWfmMjeV3fCn0IT
 5Z2JU3eyCSYgMYZHr282T7BARLiT6neyNUQ8AhMzPP76JzdW6pxlHmMZdB0qc5ODL4h9
 dTIAfGVApio3FQtTS8zEDmHH4KRuYmBYE2XNcUx04fQpRWwqO4r9qVGQpgKTNOi4uEic
 RqehqrYh6mTmB3uzl2Dk9YpAwvbBV1u3Dp+MoE0D4g/Z4K/aN5dyS2UfmMu1bBRLILNw
 Wxkqw+0ZOuLIe+c5df12j53P273GoEdnEFHR3m5YPd1PY/pFyiVUmYdqVU+lm3jINvgH
 mpDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WBuh5ANX049XvoAuYc6kDkKQiW67h+g1q8TDSOz1dqU=;
 b=mr72tBN50FBUwiy2NMjSuP8yAViBUrFl325g0CuS8Zlm4+IBsbwq9+paQ8OsGSzc4A
 +f8ZBQgFS/eFqIqaiD2XXLzrVZZGifM9GSfpE1YeqKi59pSpKTK5ORRpkQPTuTw+fVor
 eVDOTlU5n04oGUw/OyD74PjFruE+7oFlZRmIRhMyAMPI0F9sIaH0aByfsTbhhdHGxPZx
 W7NUfLH/WKRCaKrSWg03hre3z1lPBEuyoF8Pf6c46LT831HJfkk/fk+toPuXqRFZAAOv
 wdnpibPfJLAf92WSDuf+Rb2jcuSfXE8cIU5bzimrxjBPibLO2dYFwIIKS3FfyBJBpA2+
 Q3eA==
X-Gm-Message-State: APjAAAWjZ6SayUAAA/YeKwb6GJ6h5q4PjMRmn/u6LXuxyj24NdppDH7p
 8nn7JblRJyIVtAjjw4gEZsE1w4jFeizVphgE4lc=
X-Google-Smtp-Source: APXvYqzVOuz4VOsLhkc8YTufGND1jjwArsxRuKUoHzscIuXxfusDClP5+wUXXUMLe5wT6EW+hBj9NijsRym/f5FvRGs=
X-Received: by 2002:ac8:424f:: with SMTP id r15mr28256802qtm.71.1582234619657; 
 Thu, 20 Feb 2020 13:36:59 -0800 (PST)
MIME-Version: 1.0
References: <20200220083508.792071-1-anarsoul@gmail.com>
 <20200220083508.792071-4-anarsoul@gmail.com>
 <20200220135608.GE4998@pendragon.ideasonboard.com>
 <20200220212120.GA24526@ravnborg.org>
In-Reply-To: <20200220212120.GA24526@ravnborg.org>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Thu, 20 Feb 2020 13:36:46 -0800
Message-ID: <CA+E=qVfFJn_Nx+-2=m8uDk+yisJE0MrsXOEPURqzmbqVLZmEKA@mail.gmail.com>
Subject: Re: [PATCH 3/6] dt-bindings: Add Guangdong Neweast Optoelectronics
 CO. LTD vendor prefix
To: Sam Ravnborg <sam@ravnborg.org>
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
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 arm-linux <linux-arm-kernel@lists.infradead.org>,
 Rob Herring <robh+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 Torsten Duwe <duwe@suse.de>, Samuel Holland <samuel@sholland.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Chen-Yu Tsai <wens@csie.org>,
 Thierry Reding <thierry.reding@gmail.com>, Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maxime Ripard <maxime@cerno.tech>, Jonas Karlman <jonas@kwiboo.se>,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 20, 2020 at 1:21 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Laurent.
>
> > > +  "^neweast,.*":
> > > +    description: Guangdong Neweast Optoelectronics CO., LT
> >
> > Google only returns two hits for this name, beside the ones related to
> > this patch series. Are you sure this is the correct company name ?
>
> Seems legit:
> http://www.eastbl.com/
>
> But maybe their chinese name was better a basis for vendor prefix?
>
> Guangdong New Oriental Optoelectronics

They call themselves "Guangdong NewEast Optoelectronics" in English,
so I think it's better to keep it as is.

>
>         Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
