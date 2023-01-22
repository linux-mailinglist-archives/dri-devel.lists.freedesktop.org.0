Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C8467721E
	for <lists+dri-devel@lfdr.de>; Sun, 22 Jan 2023 20:49:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80DE110E2CB;
	Sun, 22 Jan 2023 19:49:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-20.smtpout.orange.fr
 [80.12.242.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A76810E2CB
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Jan 2023 19:49:29 +0000 (UTC)
Received: from [192.168.1.18] ([86.243.2.178]) by smtp.orange.fr with ESMTPA
 id JgLFpiKJCzLACJgLFpAgK4; Sun, 22 Jan 2023 20:49:27 +0100
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 22 Jan 2023 20:49:27 +0100
X-ME-IP: 86.243.2.178
Message-ID: <bd2df24b-e19e-2ba4-c3e8-0d555f69b453@wanadoo.fr>
Date: Sun, 22 Jan 2023 20:49:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] agp/amd64: Fix full name of the GPL
Content-Language: fr, en-US
To: Diederik de Haas <didi.debian@cknow.org>,
 David Airlie <airlied@redhat.com>,
 "open list:AGPGART DRIVER" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20230122181632.54267-1-didi.debian@cknow.org>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20230122181632.54267-1-didi.debian@cknow.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Le 22/01/2023 à 19:16, Diederik de Haas a écrit :
> Signed-off-by: Diederik de Haas <didi.debian@cknow.org>
> ---
>   drivers/char/agp/amd64-agp.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/char/agp/amd64-agp.c b/drivers/char/agp/amd64-agp.c
> index ce8651436609..3020fd92fd00 100644
> --- a/drivers/char/agp/amd64-agp.c
> +++ b/drivers/char/agp/amd64-agp.c
> @@ -1,7 +1,7 @@
>   // SPDX-License-Identifier: GPL-2.0-only
>   /*
>    * Copyright 2001-2003 SuSE Labs.
> - * Distributed under the GNU public license, v2.
> + * Distributed under the GNU General Public License, v2.
>    *
>    * This is a GART driver for the AMD Opteron/Athlon64 on-CPU northbridge.
>    * It also includes support for the AMD 8151 AGP bridge,

Hi,

maybe the line can just be removed.
There is already a SPDX-License-Identifier above.

CJ
