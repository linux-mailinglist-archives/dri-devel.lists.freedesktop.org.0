Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00DB41701A1
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 15:56:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EE296E338;
	Wed, 26 Feb 2020 14:56:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E54DC6E338
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 14:56:25 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id 59so3142954otp.12
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 06:56:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=4+aLnsPdP1/QbRnyIoXI03Tshsf4suv6arri2MUC+qo=;
 b=P4XSrkTf+E0qHGNtsr4afINvFP5WauSaGgxs5Asf9HF5OY/0sEwqaQAKQmd1jnlptS
 SyLSSAglYfRllqKvci8k/OUC586R14ZgtiDt39FQmdtmFANysdQQhQz6az20cFLGtjDq
 9bbbwsVBYStwxty37UzVWidbmO1lbiq2oWb4ryvxk5wFtb+GxrX2NlyZnSx7ymadJEhr
 J1d1vNRqcEA89ubn9kVYMWYD5NJ07b2vP4Q9q4SuJDd4j002BpUoGkKwtP45dW2t2NNT
 F/4Y1bSl6tuqx3AO4S7kvdaalJVmji/A78XIy3wcMVJQkiEHbrUXD03ygNhW+dwqDMSb
 P3fA==
X-Gm-Message-State: APjAAAVO1Gfm4oeyjZZcHLeMkHzrDuv8UIznmq7jDidYLh1l/iadhEZj
 ffpFzf9KQeghA5+gtjozAg==
X-Google-Smtp-Source: APXvYqzrUda0vSZtD9CpveeEfxdVZW6Zdsm+zPooigQG/TE92zsXfEODvCU6ebACAkEHgk7TJbw6sA==
X-Received: by 2002:a05:6830:1047:: with SMTP id
 b7mr3582500otp.77.1582728985048; 
 Wed, 26 Feb 2020 06:56:25 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id w197sm884841oia.12.2020.02.26.06.56.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2020 06:56:24 -0800 (PST)
Received: (nullmailer pid 23432 invoked by uid 1000);
 Wed, 26 Feb 2020 14:56:23 -0000
Date: Wed, 26 Feb 2020 08:56:23 -0600
From: Rob Herring <robh@kernel.org>
To: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: Re: [PATCH v2 3/6] dt-bindings: Add Guangdong Neweast
 Optoelectronics CO. LTD vendor prefix
Message-ID: <20200226145623.GA22420@bogus>
References: <20200226081011.1347245-1-anarsoul@gmail.com>
 <20200226081011.1347245-4-anarsoul@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200226081011.1347245-4-anarsoul@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Samuel Holland <samuel@sholland.org>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.io>,
 devicetree@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>,
 Jonas Karlman <jonas@kwiboo.se>, Torsten Duwe <duwe@suse.de>,
 Mark Brown <broonie@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 linux-arm-kernel@lists.infradead.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 26, 2020 at 12:10:08AM -0800, Vasily Khoruzhick wrote:
> Add vendor prefix for Guangdong Neweast Optoelectronics CO. LTD
> 
> Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
