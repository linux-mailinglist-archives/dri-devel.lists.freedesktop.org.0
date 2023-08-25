Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B27378925C
	for <lists+dri-devel@lfdr.de>; Sat, 26 Aug 2023 01:32:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 918BC10E168;
	Fri, 25 Aug 2023 23:32:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EF6910E168
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 23:32:52 +0000 (UTC)
Date: Fri, 25 Aug 2023 23:32:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1693006370; x=1693265570;
 bh=zRwWsMDd5Kf2yQpedEA3Ka2dLpgNvYvwuOL0uYq4mxY=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=nZFuiL4fW85fX+J1npo65OvHYrgHnoS8wSxqWSLrKmoviM0c6e46mqRMzqtH9/MWu
 Vby1zVLEV0v/ulasBpcymNz1VfCpTci/snqcsPRf5HetuWyoT192nAqyslEZTGXVBm
 qQEZzX/jRVgKdtvqS8j220WQfCl7vsOeojSW+cUAESI7H86M5acLyHKT2ym01QEojV
 0H9Z1Sf9+IzBBykN4SLirksIOs6h5MkowLtmccM1RA2sesJXM3MKtTal8HGNPLCDuw
 w+pqX7j7stkvcSKTbFHEQgDUzFkJHctAIZbQIIUO8A1aM+EYeAI+W3EFFqrF+PxMcN
 fJYTsLcLeC7nQ==
To: Stephen Boyd <swboyd@chromium.org>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/connector: Add newline to debug printk
Message-ID: <sqyPw9vZ5TuRr6bQT59K00AB1wM5QdkEdK-qUEWeesjx_nin5LzSAL1NSIOIV5PD0pKqpzqscQs0FRAjMmD98L3WcNMt4-l7J0mxqIMr7zQ=@emersion.fr>
In-Reply-To: <20230825233118.2689222-1-swboyd@chromium.org>
References: <20230825233118.2689222-1-swboyd@chromium.org>
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, patches@lists.linux.dev,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Simon Ser <contact@emersion.fr>
