Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 728D836A60F
	for <lists+dri-devel@lfdr.de>; Sun, 25 Apr 2021 11:24:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED3286E108;
	Sun, 25 Apr 2021 09:24:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch
 [185.70.40.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08CA06E108
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Apr 2021 09:24:04 +0000 (UTC)
Date: Sun, 25 Apr 2021 09:23:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1619342641;
 bh=4ap2WpvthEdWQpXqSHG5pmhDXiZte0Yr76wne4Yu8q0=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=Kcv/bKNOC4W/DWat4cBcSVHYQ7y44q4BarePz8YK4f8xhN93xOGSvDiwbkvJgs0Bk
 QUY61QJPt9ZrqP9jdk5EyjyhXnQ8bc7VlNMorcYNnN+lrG8petIf/llo+zm5pWJT7e
 BSW8965uYWggcp7axnd6hYXFNDcf2nlVDkSl91+yEf4sbRTXVKL3RuPupNGd4vxgRQ
 Gc3RplKIKM+IFBVJAXYfl+nVYhAJHnZvIvylN7JZ3IUQUzEcaTwj5ISjqhSePd7kYJ
 3mcFWvz4u+Ibc+0cZCYX11lBgToGxYehrcC4NwsMeOQb2KmtSyhvj12azGqNwU2PYL
 fHxBIA1R0B4pA==
To: Melissa Wen <melissa.srw@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/vkms: update the current status of todo list
Message-ID: <6VuYdAKRsSRdG1f3qbGGZsIT6x5fAlxYYawffzLWiFAex0SLjbI8Riy1nxfVQedycNkTke2ICJ_gDrzGql_oZsKi-7j_2N7Cwr_hZJHz1Pk=@emersion.fr>
In-Reply-To: <20210424135722.s3bwmqeutqmelxv3@smtp.gmail.com>
References: <20210424135722.s3bwmqeutqmelxv3@smtp.gmail.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: David Airlie <airlied@linux.ie>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Sumera Priyadarsini <sylphrenadin@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Saturday, April 24th, 2021 at 3:57 PM, Melissa Wen <melissa.srw@gmail.com> wrote:

> -- Real overlay planes, not just cursor.

Maybe we should mention "multiple overlay planes" as a good task?

Thanks,

Simon
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
