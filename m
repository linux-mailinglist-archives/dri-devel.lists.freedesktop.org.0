Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB04A2E81C0
	for <lists+dri-devel@lfdr.de>; Thu, 31 Dec 2020 20:16:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F9A589B57;
	Thu, 31 Dec 2020 19:15:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com
 [209.85.166.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 835D289B57
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Dec 2020 19:15:58 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id o6so17793296iob.10
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Dec 2020 11:15:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+lkPg057yNBJ7KmMevFmNY1g6DJbx0e6fBNJvucI1aw=;
 b=tXPoF21TBTs5za2Nbk+osNK4qmZc2+sn2R23pAz6PvzZ6/hzVE7LZY8Ix0Z/NtAnMU
 zl6+T23iG16Q0G31Qv5szbHczgsUani25QolB6znmwmLYWxXkbOWw7VNrhaghdYvh+Mx
 TEqHDOfgsQPZ+yfyCjQVEmVrheYVcL6bHT6BrTTgmCpupXg4WoK0PGZnPijLiCHhNkXc
 pc/XehZgk8NnEonRAXSZ4KxL+cgBcLpZd1AySkef06LirwTes9c/iDz3L4dUOaqvphRs
 Y4cfXsfrE2Q3x1RhAnokXgsiYnaRlF5nasvfASb/x0ScCHuEYSs95wk0SXjO8b2JiUHz
 Qafw==
X-Gm-Message-State: AOAM530hHH79H2AKZ6yeF3ShzgG6lfInYoomHK97yFWm98FtuFNdzKgp
 q+S9EewT5kKetCHDca8lktJf2BkbUQ==
X-Google-Smtp-Source: ABdhPJzQhSaOD9fZsc0CStKiCNRiCrKPY1YfqvXlwLB92jNZwRq9tEh7jp3L4CF6RFQY01rdBiffiA==
X-Received: by 2002:a6b:dd13:: with SMTP id f19mr48168674ioc.74.1609442157914; 
 Thu, 31 Dec 2020 11:15:57 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id f20sm23983991ilr.85.2020.12.31.11.15.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Dec 2020 11:15:57 -0800 (PST)
Received: (nullmailer pid 2196828 invoked by uid 1000);
 Thu, 31 Dec 2020 19:15:55 -0000
Date: Thu, 31 Dec 2020 12:15:55 -0700
From: Rob Herring <robh@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: [PATCH v2] dt-bindings: display: bridge: tc358768: Change
 maintainer information
Message-ID: <20201231191555.GA2196751@robh.at.kernel.org>
References: <20201218083522.21743-1-peter.ujfalusi@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201218083522.21743-1-peter.ujfalusi@ti.com>
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
Cc: devicetree@vger.kernel.org, jernej.skrabec@siol.net,
 narmstrong@baylibre.com, airlied@linux.ie, peter.ujfalusi@gmail.com,
 jonas@kwiboo.se, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 a.hajda@samsung.com, robh+dt@kernel.org, Laurent.pinchart@ideasonboard.com,
 sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 18 Dec 2020 10:35:22 +0200, Peter Ujfalusi wrote:
> My employment with TI is coming to an end and I will not have access to
> the board where this bridge is connected to and I will also loose access to
> the manual of the chip.
> 
> Add the missing copyright information, author and change the maintainer to
> Sam Ravnborg (thank you for volenteering!)
> 
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
> ---
>  .../devicetree/bindings/display/bridge/toshiba,tc358768.yaml  | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
