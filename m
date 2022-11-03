Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4708F6178DE
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 09:36:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A661010E1AB;
	Thu,  3 Nov 2022 08:36:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6652F10E1AB
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Nov 2022 08:36:37 +0000 (UTC)
Date: Thu, 03 Nov 2022 08:36:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1667464594; x=1667723794;
 bh=D7MpYv8aAumuNEEoCw+ABOp1iJcxQtWLBfvqwLX/w3g=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=bBKciuuxslZSsSW2meJZ5Jl88j9EncFs+3/JTpfDcSfbhJz7W9HCNTQhx7In8tqlP
 +QfJpyqe1lu2V2mTcQlAiWZPBpRNoq/VCos+8uRcnn9acx9VCfSl9q3TlNkzsxKzoS
 2Y+dmrd6xpkVsJW5bpqKjLAEgYbGJCjZlJaAcUNtqiJbW+bj2SmCAlec0GvWmTSgIO
 Wmbitnr3wKsxVrfopY7tzoXNSR3f7YuAK6/aIxYLInlVgU/YIt4vR/WcW/M6PhmdJh
 Z5/0gYBvL9qGC0L7eDit4lQ6KloefjcnGoMZvXtMxOGxCGjnJtsJhkrKdt1qcMCYmy
 CuxoCs4NjHXLA==
To: "xorg-announce@lists.x.org" <xorg-announce@lists.x.org>
From: Simon Ser <contact@emersion.fr>
Subject: [ANNOUNCE] libdrm 2.4.114
Message-ID: <uBOyaDS0A5l-PXoigNWJOxWeYHY7-I2iwcvh-pJ5FYlK2p7k6Yyc_ffjH5uIfQhy9AuPbHGDGPoRUK0REHJhNj3lqTmHDZfBvHi1bD-Kt1s=@emersion.fr>
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Alex Deucher (5):
      amdgpu.ids: use consistent formatting for RID
      amdgpu.ids: sort the file
      amdgpu.ids: update to the latest marketing name
      amdgpu_ids: add MI marketing names
      amdgpu: Add a default marketing name if none is found

Eli Schwartz (1):
      meson: fast-fail on unsupported OSes

Jordan Justen (2):
      include/drm/drm_fourcc.h: Update from Linux v6.0-rc7
      include/drm/i915_drm.h: Update from Linux v6.0-rc7

Marco Felsch (1):
      tests/util: add imx-lcdif driver

Simon Ser (9):
      intel: move declarations to top in drm_intel_gem_bo_unreference()
      build: automatically disable Intel if pciaccess is not found
      xf86drm: handle DRM_FORMAT_BIG_ENDIAN in drmGetFormatName()
      amdgpu: silence uninitialized variable warning
      xf86drmMode: add helpers for dumb buffers
      modetest: drop unused offset field in struct bo
      modetest: use sized integers in struct bo
      modetest: use dumb buffer helpers
      build: bump version to 2.4.114

git tag: libdrm-2.4.114

https://dri.freedesktop.org/libdrm/libdrm-2.4.114.tar.xz
SHA256: 3049cf843a47d12e5eeefbc3be3496d782fa09f42346bf0b7defe3d1e598d026  l=
ibdrm-2.4.114.tar.xz
SHA512: 8dcd4be5674e3ea2ab4394fa8f461914e5aa7f4f57a2f448c5216d84ee6682e16b4=
5eafabf97b7d9f5c062183d9a6bf3f0c97499d4cb01c19807a51209a0f644  libdrm-2.4.1=
14.tar.xz
PGP:  https://dri.freedesktop.org/libdrm/libdrm-2.4.114.tar.xz.sig
