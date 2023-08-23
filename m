Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B76A47854C8
	for <lists+dri-devel@lfdr.de>; Wed, 23 Aug 2023 12:01:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0861410E0BA;
	Wed, 23 Aug 2023 10:00:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9423410E0BA
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 10:00:55 +0000 (UTC)
Date: Wed, 23 Aug 2023 10:00:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1692784849; x=1693044049;
 bh=Mf40cWEMPjsejxcoX0JSekZCBlHOZDBJLL1ZnX/TK+I=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=N2dz+BellOOnEKm4rkzUIFGkMurVAVGO1ce8egWPrsdOZCSl8vw57zpMaNVdXcxrm
 YSyTMfd2aWkYDO4eTvrNN1Od5wGboWc79MtGdWPWMKto3feHuydyxII0F+9ei91NRx
 w1rEK6lb7bnp05Xakp2weIG5S2fSC/k6KVxzBHGAMtzFaqWYpOa45y1EQfV9Du4AG0
 ChN8Qg1HTcha7nJNBs2EMO1NFyLeAk/azHA+YGD99qJrtl9xQdHXegJmxsgBNDFN7Q
 /KZ/UKLU1E5HsyTKgyoVprF1vHtElZR/WoPiw6Hh+K7BAN3ukm9VfATkU1knlfIgzQ
 SAxAhHCC84JNQ==
To: "xorg-announce@lists.x.org" <xorg-announce@lists.x.org>
From: Simon Ser <contact@emersion.fr>
Subject: [ANNOUNCE] libdrm 2.4.116
Message-ID: <n4aXxvbmx4ZaFOlPixDwmNd6muZIiD5lsPJH8RzZQR3YHzMCCxM9OpWsJtLiGo6UAPcEv5zZkZQBzHuiDHyBmtj9D3-6I7BMhEJgjxB47F8=@emersion.fr>
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

Dor Askayo (1):
      nouveau: add interface to make buffer objects global

James Zhu (2):
      xf86drm: update DRM_NODE_NAME_MAX supporting more nodes
      xf86drm: use drm device name to identify drm node type

Jan Beich (1):
      meson: drop pthread-stubs dependency on BSDs

Jonathan Gray (1):
      amdgpu: add marketing names from amd-5.4.3 (22.40.3)

Luben Tuikov (3):
      tests/amdgpu: Fix Usage string
      tests/amdgpu: Add all 9 options to the help output
      tests/amdgpu: Allow to exclude a test or a suite of tests

Marek Ol=C5=A1=C3=A1k (1):
      amdgpu: add an environment variable that overrides the context priori=
ty

Pierre-Eric Pelloux-Prayer (1):
      amdgpu: remove va::dev member

Ruijing Dong (3):
      tests/amdgpu/vcn: change vbv_buffer name to input
      tests/amdgpu/vcn: fix drm test failure
      tests/amdgpu/vcn: fix session buffer issue for vcn1-vcn3

Saleemkhan Jamadar (1):
      tests/amdgpu/vcn:update decoder unit test

Simon Ser (5):
      xf86drm: bump DRM_MAX_MINOR to 64
      xf86drm: drop control nodes implementation
      Sync headers with drm-next
      xf86drm: add drmSyncobjEventfd
      build: bump version to 2.4.116

Xaver Hugl (1):
      xf86drmMode: constify drmModeCrtcSetGamma

Yi Xie (1):
      tests/util: Add vkms driver

jie zhang (1):
      test/amdgpu/hotunplug: add apu check for hotplug test

git tag: libdrm-2.4.116

https://dri.freedesktop.org/libdrm/libdrm-2.4.116.tar.xz
SHA256: 46c53f40735ea3d26d614297f155f6131a510624a24274f654f6469ca905339a  l=
ibdrm-2.4.116.tar.xz
SHA512: 1287d1896deeb8cfb4532c6750eb43493dcefbfaaa598a73bbb682aa749594eaad3=
ed1fa2fe73d06280350f365a92a0c20cad8be76f3da2ed59b04aa008de911  libdrm-2.4.1=
16.tar.xz
PGP:  https://dri.freedesktop.org/libdrm/libdrm-2.4.116.tar.xz.sig
