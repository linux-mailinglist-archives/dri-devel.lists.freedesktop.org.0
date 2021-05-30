Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D032395098
	for <lists+dri-devel@lfdr.de>; Sun, 30 May 2021 13:09:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 914026E22B;
	Sun, 30 May 2021 11:09:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 474 seconds by postgrey-1.36 at gabe;
 Sun, 30 May 2021 11:09:37 UTC
Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net
 [IPv6:2a01:37:3000::53df:4ef0:0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2601B6E22B
 for <dri-devel@lists.freedesktop.org>; Sun, 30 May 2021 11:09:37 +0000 (UTC)
Received: from h08.hostsharing.net (h08.hostsharing.net
 [IPv6:2a01:37:1000::53df:5f1c:0])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "*.hostsharing.net",
 Issuer "RapidSSL TLS DV RSA Mixed SHA256 2020 CA-1" (verified OK))
 by bmailout2.hostsharing.net (Postfix) with ESMTPS id E84782800B3CA;
 Sun, 30 May 2021 13:01:39 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
 id DB36B197A; Sun, 30 May 2021 13:01:39 +0200 (CEST)
Date: Sun, 30 May 2021 13:01:39 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Subject: Re: [PATCH 2/2] maintainers: Update freedesktop.org IRC channels
Message-ID: <20210530110139.GA2678@wunner.de>
References: <20210529141638.5921-1-alyssa@rosenzweig.io>
 <20210529141638.5921-2-alyssa@rosenzweig.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210529141638.5921-2-alyssa@rosenzweig.io>
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
Cc: David Airlie <airlied@linux.ie>, Hector Martin <marcan@marcan.st>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, May 29, 2021 at 10:16:38AM -0400, Alyssa Rosenzweig wrote:
> Like many free software projects, freedesktop.org issued a non-binding
> recommendation for projects to migrate from OFTC to Freenode [1]. As
> such, freedesktop.org entries in the MAINTAINERS file are out-of-date as
> the respective channels have moved. Update the file to point to the
> right network.
> 
> [1] https://lists.freedesktop.org/archives/dri-devel/2021-May/307605.html
[...]
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1651,7 +1651,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  S:	Maintained
>  W:	https://asahilinux.org
>  B:	https://github.com/AsahiLinux/linux/issues
> -C:	irc://chat.freenode.net/asahi-dev
> +C:	irc://irc.oftc.net/asahi-dev
>  T:	git https://github.com/AsahiLinux/linux.git
>  F:	Documentation/devicetree/bindings/arm/apple.yaml
>  F:	Documentation/devicetree/bindings/interrupt-controller/apple,aic.yaml

This isn't a freedesktop.org project, so either needs to be dropped
from the patch or the patch needs an ack from Hector Martin (+cc).

Thanks,

Lukas
