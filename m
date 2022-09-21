Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CABAA5E543F
	for <lists+dri-devel@lfdr.de>; Wed, 21 Sep 2022 22:12:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC73D10E0DA;
	Wed, 21 Sep 2022 20:12:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C68E10E0DA
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Sep 2022 20:12:40 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 55B0B7F9;
 Wed, 21 Sep 2022 20:12:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 55B0B7F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1663791159; bh=HCyw+9UYLfNJ7d/Ja91BuDVnp8I7ZyuTH/KCTIXzVbY=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Gwl5RHBCP2sRiGkW7Q9ibExU4CkooWU1s4ehou7KP46wH6sZYFmm3nES8T/RMyDAU
 TR32ucz2dwWTEu3Wu8ODASBb1B+6dkGbEQTfMkAQJfSzYXhXm2Ke/vOszg3a3ZOOAH
 VF1Wsw9DcU0wjhQ6CBWGJQzKQMQzy7jpbX0P504bh64IGhSbBGZ71kjB+Hu7G9Mxtn
 vfr7QheNxQe3Zh/+MOQiZcRN5cPwtOHgA0LsxYaISmcGYEE7tyr6X7eWhK5QA7eDYq
 Hw93WucxfArzuOY1GNXYMTIvzXMrz98E24J4kYRWKSzAdBKqPFtO4u+fqT517aPW5I
 btMlgHhXuRgeg==
From: Jonathan Corbet <corbet@lwn.net>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Documentation: fb: udlfb: clean up text and formatting
In-Reply-To: <20220828192501.14232-1-rdunlap@infradead.org>
References: <20220828192501.14232-1-rdunlap@infradead.org>
Date: Wed, 21 Sep 2022 14:12:38 -0600
Message-ID: <874jx0v64p.fsf@meer.lwn.net>
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
Cc: linux-fbdev@vger.kernel.org, linux-doc@vger.kernel.org,
 Helge Deller <deller@gmx.de>, Randy Dunlap <rdunlap@infradead.org>,
 Bernie Thompson <bernie@plugable.com>, dri-devel@lists.freedesktop.org,
 Bagas Sanjaya <bagasdotme@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Randy Dunlap <rdunlap@infradead.org> writes:

> Clean up punctuation, spelling, and formatting for command line usage
> and modprobe config file usage in udlfb.rst.
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Bernie Thompson <bernie@plugable.com>
> Cc: linux-fbdev@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: Helge Deller <deller@gmx.de>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> Cc: Bagas Sanjaya <bagasdotme@gmail.com>
> ---
> v2: use some text suggestions from Bagas Sanjaya (Thanks);
>     add a '.' at the end of a sentence.
>
>  Documentation/fb/udlfb.rst |   23 +++++++++++++++--------
>  1 file changed, 15 insertions(+), 8 deletions(-)

Applied, thanks.

jon
