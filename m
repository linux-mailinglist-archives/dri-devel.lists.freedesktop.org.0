Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D975437A2
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 17:40:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 519851127C4;
	Wed,  8 Jun 2022 15:40:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.proton.ch (mail-40136.proton.ch [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D9AE1127C8
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 15:40:12 +0000 (UTC)
Date: Wed, 08 Jun 2022 15:40:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1654702810; x=1654962010;
 bh=UCcQZenfE+6rWnoVBlrwhToeLvaduCRC7GsJ2SXx8bw=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
 Feedback-ID:Message-ID;
 b=mEsbXQry0vpktFc83FZT2Lo6p9nUl386W3EbRfMll3qrcYgPTI0SIc2I64Othy2K7
 JJSA7WHZfYSPyfGnhbLh8uFydWZRZVH9gHhcnhmEYboFuFD3ymhT0nun2lOhW0GVvp
 rc5nEx0qT8EA5dUX+UIQPkLzhfNvZoagltyoL8mKBaWdV6oJaiqK6OWPynDnEZRvc/
 euGVWpk98uyaWkMQDiO0HXUMRuvDmJAPW9J9I1+lrzI62W0ioRkvwObAlMILqeUEYu
 zVYAzl/gW1PusrmkrJA7MRt8hzs7o5tmZ3h8IkUw+peJ0qD5zWkTHrfS5ikUNsnZLF
 4spqcqREy2b9g==
To: Jason Ekstrand <jason@jlekstrand.net>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 1/2] dma-buf: Add an API for exporting sync files (v14)
Message-ID: <Q5tld7A7XW0xpz2bo3Lo-tAE0U6YY6UqFq79WpN2bMEy1qNPZGpGm2krLCg4wYR6DAvgXPCZd-nkba_GcbMzYu7AYRH21XaTtUcdRL40978=@emersion.fr>
In-Reply-To: <20220608152142.14495-2-jason@jlekstrand.net>
References: <20220608152142.14495-1-jason@jlekstrand.net>
 <20220608152142.14495-2-jason@jlekstrand.net>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Jason Ekstrand <jason.ekstrand@collabora.com>,
 dri-devel@lists.freedesktop.org,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Jason Ekstrand <jason.ekstrand@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Both patches pushed to drm-misc-next, thanks for your contribution!
