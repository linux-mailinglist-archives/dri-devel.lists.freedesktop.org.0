Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 640FB1AD059
	for <lists+dri-devel@lfdr.de>; Thu, 16 Apr 2020 21:31:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7034C6EB4E;
	Thu, 16 Apr 2020 19:31:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C66906EB4E
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 19:31:02 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id q204so17544377oia.13
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 12:31:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=83Bpp8uoGsIBtYSm1pLHa49KTy+QHzu3gut9+0c+dz8=;
 b=rsvZP40QxxxMyPGl8z3c1o7454IUKXRTO8LBAdNlBlCqX74547w8G9lCFBPnvT+G7t
 JIiFjMIn6waPnHRQ4QgdSFtePkl5bm0YOgqrDKId43xPcffiSRbxlib3rFzYJFo4mQsQ
 wBwA9mUfnROB/UiEy9DYGQ3mwtpgVDbZta2/pMM1cme/9tLYgMElv+cO8XWjvE9cqSPX
 XvCZFA3GOaS0/suoPekpLsFNftu4fGsMNaDXqWrx9q/LSc4H/nkDtEfmIDVd3Y6e/R/B
 ZjnRW2gNviHYB8l3tV0eXvjbFVvv8A2p17jhrPOswCPgNTYf5Y+Or3cG8GILHQxCiN9B
 lHiQ==
X-Gm-Message-State: AGi0PuZFmq6pqXqztX/EefAM+WUCCy4lFkr66ozGvfrR8EC5mcRlkXxi
 IBZ96ttvTPvDgYOd2i/ciw==
X-Google-Smtp-Source: APiQypKtFNn7klGmlxS7O33zd15hLes5Ce7gwnHv476q+1Q8X3OSIexFGD7vX+EbNCMQi+0zLh3qvw==
X-Received: by 2002:aca:d705:: with SMTP id o5mr4155329oig.67.1587065461930;
 Thu, 16 Apr 2020 12:31:01 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id r205sm7324602oih.47.2020.04.16.12.31.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2020 12:31:01 -0700 (PDT)
Received: (nullmailer pid 19733 invoked by uid 1000);
 Thu, 16 Apr 2020 19:31:00 -0000
Date: Thu, 16 Apr 2020 14:31:00 -0500
From: Rob Herring <robh@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH trivial 1/6] dt-bindings: Fix misspellings of "Analog
 Devices"
Message-ID: <20200416193100.GA19671@bogus>
References: <20200416103058.15269-1-geert+renesas@glider.be>
 <20200416103058.15269-2-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200416103058.15269-2-geert+renesas@glider.be>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dmaengine@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 16 Apr 2020 12:30:53 +0200, Geert Uytterhoeven wrote:
> According to https://www.analog.com/, the company name is spelled
> "Analog Devices".
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  .../devicetree/bindings/display/bridge/adi,adv7123.txt        | 4 ++--
>  .../devicetree/bindings/display/bridge/adi,adv7511.txt        | 4 ++--
>  Documentation/devicetree/bindings/dma/adi,axi-dmac.txt        | 2 +-
>  Documentation/devicetree/bindings/iio/dac/ad5755.txt          | 2 +-
>  4 files changed, 6 insertions(+), 6 deletions(-)
> 

Applied, thanks.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
