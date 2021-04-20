Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B5936549C
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 10:52:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A03A6E4A2;
	Tue, 20 Apr 2021 08:52:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.protonmail.ch (mail-40136.protonmail.ch
 [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ABFE6E4A2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 08:52:13 +0000 (UTC)
Date: Tue, 20 Apr 2021 08:51:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1618908731;
 bh=5mZf7FMqmdnXoFUD7CJdahT1YxZWgP+Sqcn+HtLB3a4=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=JModl2SXdTiBMbm5e/18QmL0GNTt1BrxqbB8aSQQWnm5Vf24m3k9+Qd0lcZsx3iEx
 ZuRE08EKEl1gO07XUHh8ZZIFYDubMRCtX9vrC49+U+mlhRy8GIF8+VvrLpzNDTx28h
 g2ADpA39nwDqpls1YCp4KnEtVfpdDdCPso6ELcuzyAd/oL/EnbMzK6AY2EW2xJLjjs
 pwcTMtO0XK4TAZR4+tQbrGvw3HYQd1k8Ot4cWIR8bGQ66fcJ0YtPFGdIXaaaZ5uj0a
 Am+O98hqkID/GmWzU0NARFsLRyViII8e0ydEjT9xeo5eSf+3M4lw8KysdFkP4QQW/P
 mbRgA7upXcqSQ==
To: Leandro Ribeiro <leandro.ribeiro@collabora.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 1/2] drm/doc: document drm_mode_get_plane
Message-ID: <oL7W1G-urKbR74niw2ys8A2s-QYsMZFu57QEo3F3C5LFwzvqE0n5RDYTc7XLaatuFpGVZG8HedUybAIDbrLpYF16KZMp5Ll0yI_6Jn06bo8=@emersion.fr>
In-Reply-To: <3ce15bc5-0be3-6774-fd05-ceebbaf1b60e@collabora.com>
References: <20210406192118.12313-1-leandro.ribeiro@collabora.com>
 <20210406192118.12313-2-leandro.ribeiro@collabora.com>
 <YG23lE7V0qjJNJu4@intel.com>
 <3ce15bc5-0be3-6774-fd05-ceebbaf1b60e@collabora.com>
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
Cc: airlied@linux.ie, pekka.paalanen@collabora.co.uk, kernel@collabora.com,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Leandro,

Any chance you could re-spin at least the first patch?

Thanks,

Simon
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
