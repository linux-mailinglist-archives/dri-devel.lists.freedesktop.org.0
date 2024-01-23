Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1555839B5E
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 22:46:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E20810E168;
	Tue, 23 Jan 2024 21:46:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3D0D10E168
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 21:46:23 +0000 (UTC)
Received: from localhost (c-98-53-138-11.hsd1.co.comcast.net [98.53.138.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 36AC17A98;
 Tue, 23 Jan 2024 21:46:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 36AC17A98
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1706046379; bh=HPI8p2QRl4kGlKIQRh26wR6sCf+wAiwRF3Njhaehc68=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=qayLSBactxJVtDUoeQiCqnap39JvQUIaSgBdtiN6R7lqTyj1I1acdx6AW+BMv6R5r
 PPo+XES7zSaKY9/KhtXLdYe6WTyEdfs4JIwDDNzZHJyXoCRhhvhl9zPk7lozPEtNpi
 GxY6NhwGkmS3PLhVLyCoAAaIX/0s5R6wJNeeXjLNEro8NAzD7Io/1A2aDMas6i6mJC
 cjqQnCxjymqYChsNKnnYfx6h4azhAE5uA8LqxMQzRPZApQGJvGSlJ7h3yHB7u1ikbu
 30fpYZ+x0NjoonJ9TBRCnovC1JFsbw3dvZuyHGUfRMIAdmNRM5RgoRDbDUFWxydImJ
 sn/kiOoq16vzw==
From: Jonathan Corbet <corbet@lwn.net>
To: Hu Haowen <2023002089@link.tyut.edu.cn>, ogabbay@kernel.org
Subject: Re: [PATCH] docs/accel: correct links to mailing list archives
In-Reply-To: <20240118090140.4868-1-2023002089@link.tyut.edu.cn>
References: <20240118090140.4868-1-2023002089@link.tyut.edu.cn>
Date: Tue, 23 Jan 2024 14:46:18 -0700
Message-ID: <87jznzk9jp.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hu Haowen <2023002089@link.tyut.edu.cn> writes:

> Since the mailing archive list lkml.org is obsolete, change the links into
> lore.kernel.org's ones.
>
> Signed-off-by: Hu Haowen <2023002089@link.tyut.edu.cn>
> ---
>  Documentation/accel/introduction.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/accel/introduction.rst b/Documentation/accel/introduction.rst
> index 89984dfececf..ae3030136637 100644
> --- a/Documentation/accel/introduction.rst
> +++ b/Documentation/accel/introduction.rst
> @@ -101,8 +101,8 @@ External References
>  email threads
>  -------------
>  
> -* `Initial discussion on the New subsystem for acceleration devices <https://lkml.org/lkml/2022/7/31/83>`_ - Oded Gabbay (2022)
> -* `patch-set to add the new subsystem <https://lkml.org/lkml/2022/10/22/544>`_ - Oded Gabbay (2022)
> +* `Initial discussion on the New subsystem for acceleration devices <https://lore.kernel.org/lkml/CAFCwf11=9qpNAepL7NL+YAV_QO=Wv6pnWPhKHKAepK3fNn+2Dg@mail.gmail.com/>`_ - Oded Gabbay (2022)
> +* `patch-set to add the new subsystem <https://lore.kernel.org/lkml/20221022214622.18042-1-ogabbay@kernel.org/>`_ - Oded Gabbay (2022)

Applied, thanks.

jon
