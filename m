Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D759CC64DBB
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 16:24:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AA3110E3C7;
	Mon, 17 Nov 2025 15:24:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="RH07/SX4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4327.protonmail.ch (mail-4327.protonmail.ch [185.70.43.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B96310E3C7
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 15:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1763393051; x=1763652251;
 bh=VTXq7WhEcnLbvGt1osiAMfyLGuTZFN6x7o+Z09rYaLY=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=RH07/SX46IFZ8nCYBDGiI8lOaBEdNSCT6vpP7x8db9JROjHqvGLlbKYeYU/vcdjnn
 Dwt8k1DrT+lzQtbrAj0oin4wOAimhVKiyYkKFv3RLiPV3RJRtBjNHTJlCQMaKsOog/
 pjPNTnqN7KFWEGNUN23YXmoXhV9DesRw47pOfNObeG9ixvOioGIMdt5n3R9nNDxnGI
 Y0H2wuPgu1/yqV9IZr1rr3Y5zl+VFgEss4m06cqv5/XTLIMEZhSSwGWoRxqg1n0Opy
 7GPg4Qv24OjuoINiN29XzB7C5WDviwfmT0ShNEqvy7cH9+nU2UfnHFpOBfTwGl5xid
 uGKzwI2hY3ewA==
Date: Mon, 17 Nov 2025 15:24:04 +0000
To: "xorg-announce@lists.x.org" <xorg-announce@lists.x.org>
From: Simon Ser <contact@emersion.fr>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [ANNOUNCE] libdrm 2.4.129
Message-ID: <5Ey8I6tbK5yC-28Mq0EDAbN6A8ZxEopSszDK-Lvt2y6N2qu5Hlu2jvxO_TcyjmNHWkpxVTVia3y6DVhaLssW6UoZzjVm0ZDAvzYInSl6ztI=@emersion.fr>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: d67fc2c9a011a5958b428e069a6b28afa8afe1af
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

Alex Deucher (1):
      amdgpu: update marketing names

Samuel Pitoiset (1):
      amdgpu: update marketing names

Simon Ser (2):
      Sync headers with drm-next
      build: bump version to 2.4.128

git tag: libdrm-2.4.129

https://dri.freedesktop.org/libdrm/libdrm-2.4.129.tar.xz
SHA256: 5978183f978d697e26a50ba066174964efb0ab97caa1ecaa1b861fbe5ddf77dc  l=
ibdrm-2.4.129.tar.xz
SHA512: 3ee702cc4a578e9ab231caf8a84700e4dff6f3da70731610121ac2c3390f42e42ad=
144ea61c53582e3a8adfb1d6bf8254993c5c6eaf85a51421e26d51d341cd4  libdrm-2.4.1=
29.tar.xz
PGP:  https://dri.freedesktop.org/libdrm/libdrm-2.4.129.tar.xz.sig
