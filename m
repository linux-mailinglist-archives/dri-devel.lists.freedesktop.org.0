Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F10CAD39C
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 14:17:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFE8410E14C;
	Mon,  8 Dec 2025 13:17:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="IW6eTAuC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-106110.protonmail.ch (mail-106110.protonmail.ch
 [79.135.106.110])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F01C810E45D
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Dec 2025 13:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1765199865; x=1765459065;
 bh=UMOrn2sbgrZzwqU0T4sWNHXUGxDeu8w08+wdMrADag0=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=IW6eTAuCtcx+vDDeLEahUdv+TC8dRkLg0Hi9KKR11Kqw5lIlhmsAt+NDhbxi2Jnla
 gGTbC8DdFPubwOSPwIr2Jp+3+k4GgDFMW/xfP8lNq2vEKmEbAmN8ArtPQy+khRu29g
 ftQN7bPPWS+/+3rUEAO7NDVhBhoj4crsrM6xgMVfP//Dgy6dPxzUcv0/YW2r1gIB+0
 3E2RYSaDsB92g94Zq1LWVN1LqsAiJqC2v0NtJT6g6nIrp8uNzMSwBNlZ9WnMFddb1F
 r6Sm5ZPKSCe4P84rea8rKhGqoFlQ5pvjYuEUph1zCeAp9eVNWHAYP8+GdQgfAz++im
 Yo5TRETjXcXzw==
Date: Mon, 08 Dec 2025 13:17:40 +0000
To: "xorg-announce@lists.x.org" <xorg-announce@lists.x.org>
From: Simon Ser <contact@emersion.fr>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 wayland-devel <wayland-devel@lists.freedesktop.org>
Subject: [ANNOUNCE] libdrm 2.4.130
Message-ID: <ZdjCR9RC6oV885CFCfRpL94QWarSx7ezotDoq2py_w9dK9ti_5yeDtQX8oihhl5gAS-Nwy8IyBbbwZ6rkqdzD94JjhChC7GdZi6oUTvMGOc=@emersion.fr>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: b4a72a40fcc7b4301d1259403b3bd481034ab1b8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Andrew Davis (1):
      omap: fix omap_bo_size for tiled buffers

Sergio Costas Rodriguez (3):
      amdgpu: add env support for amdgpu.ids path
      Support multiple paths in AMDGPU_ASIC_ID_TABLE_PATH envar
      amdgpu: Fix envar name in documentation

Simon Ser (2):
      Sync headers with drm-next
      build: bump version to 2.4.130

Val Packett (1):
      headers: drm: Sync virtgpu_drm.h with Linux v6.16

git tag: libdrm-2.4.130

https://dri.freedesktop.org/libdrm/libdrm-2.4.130.tar.xz
SHA256: a5c585ba8484c85fa8029bc8d0aad2af814e800b36e0f67150971b5037716ea5  l=
ibdrm-2.4.130.tar.xz
SHA512: 1346df2d25552346ceea526ac7b1f0c3c9e4815ac246ba4ca61f54b9e27a5938d0e=
8041f22348eadce267cd8f6fd27d8ec2b0630f39451c3ec61ff2254896341  libdrm-2.4.1=
30.tar.xz
PGP:  https://dri.freedesktop.org/libdrm/libdrm-2.4.130.tar.xz.sig
