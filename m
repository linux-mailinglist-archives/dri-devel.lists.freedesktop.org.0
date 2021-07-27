Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 506EA3D71F9
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 11:27:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62B6E6E9CD;
	Tue, 27 Jul 2021 09:27:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.protonmail.ch (mail-4323.protonmail.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D4C56E9CD
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 09:27:44 +0000 (UTC)
Date: Tue, 27 Jul 2021 09:27:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1627378061;
 bh=28pVAan+al4D9PP5MZ9VZsQXtAZrqaMQWUdlXL3vPVk=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=bLFLZw988lDYVvXbDpl5WqUbmBVHz5qslH4EqMnxa+oI2vEqQdhijU14GMkdpS+N2
 MSnWrXInxnzMINzCwjZA8+2rlYtgLZKEoGUAQOQjF4xFzfyFZ57e+QwsvDSYAVAA50
 0erFHH59ZqXNXGAEjAouojyLZhkG+ztpYlBDHBlKGNoc9/JjJLEyE6g/ta6DCIvajV
 q5XHpqQ5MapVuOB0ehEXWF+b+0L0cjCQEvap/aq/F+Ssyi+v1egqLT3NYiLHp8rbKr
 PKqhU9Y60e6zw8OAcVo+9RPngG3vZEXlhka9PqZ3gjr0RjpxmMsd5p9WvGsKI4Yzxk
 5Cu1tabTymBGQ==
To: Daniel Vetter <daniel@ffwll.ch>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: document drm_mode_get_property
Message-ID: <Gh7_q3oJ5D1yNiNg-yuyn6Hm2-0-gTCtKsBpJ63_NL4ahWffJCACU_xnvQ_1lNMIlT7FUq2pSmuSCgIOJN9FZjG4EigLhRUchAQlBV7xe1w=@emersion.fr>
In-Reply-To: <YP/RPqNowY2hS6m7@phenom.ffwll.local>
References: <1tz9tpGFTp14Rdm6Qrih80WnzsUdM9GdHBqcT7t0zuc@cp3-web-021.plabs.ch>
 <YPgHeJ4gcKI1YaUa@phenom.ffwll.local>
 <QjQOQBq4Tf992ih6qPcE1Rw5VNKcjiPbctKkIBBbwFgudHtGSlI8-sNjPVLBUBfNIEbjlQFUa_oab6AGMPmyrQ656Hc2HOdBxLef7QCf5bw=@emersion.fr>
 <YP/RPqNowY2hS6m7@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Leandro Ribeiro <leandro.ribeiro@collabora.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, July 27th, 2021 at 11:26, Daniel Vetter <daniel@ffwll.ch> wrote=
:

> I think the least intrusive one is `Title Test`_ or so. There's also othe=
r
> places where we use :ref: but that's more cumbersome to read in plain
> text.

Yeah, tried it, doesn't work. The link doesn't appear.
