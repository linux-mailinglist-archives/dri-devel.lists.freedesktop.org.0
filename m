Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BCE2664449
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 16:16:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 797D610E111;
	Tue, 10 Jan 2023 15:16:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4022.proton.ch (mail-4022.proton.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E272910E111
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 15:16:05 +0000 (UTC)
Date: Tue, 10 Jan 2023 15:15:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1673363763; x=1673622963;
 bh=OIpsXNSXiQX2+u5NhaG+g2vGcpI5c0rvpdJemusUDtg=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=ljxfUFRKpDotckB0rBfR077L5lVUoKjHcBlAQk0BuvRjjp8En7LEV2ex2rTHbh+MA
 4uzUuWGnuZGIZQEIjr8EXGJ5iirE3Wj1Mmz4qHYBx83NUByyICNkFGA6yOYp18wMSS
 KoMmdI0ujOdNC5/0Ec/ka8CCBYx8P8ed0PSJmoynsx4V2t9tuNH8uI8ZV/HWBIBDnu
 RyESygxlfU+gJeFNRxPT7mF+2J80ZBOODcDQqqnZyu84q63sKtJV16Zyb85mKaXDON
 7F9OtmmUEesiDvC4rNLQrurVewnNpBhL75o6C/ByjEGJrxk7630h8eJ3/NDmSfqkK4
 IWf4ULIxdGuzQ==
To: Siddh Raman Pant <code@siddh.me>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v6 00/10] drm: Remove usage of deprecated DRM_* macros
Message-ID: <C6RlXueyDNu9t4z9O_S7mx1gZbmzjCcHqbarn7w6QZcNVuBLUAKwyzGZQXk2dIQSxcauzlHqtkFwPveNglu8ZDtU875E7X4pS9zQsYyfMPA=@emersion.fr>
In-Reply-To: <cover.1673269059.git.code@siddh.me>
References: <cover.1673269059.git.code@siddh.me>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I pushed the last 3 patches to drm-misc-next.
