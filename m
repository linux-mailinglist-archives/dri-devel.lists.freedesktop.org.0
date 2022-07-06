Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 961CB56820A
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 10:47:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 786B011299B;
	Wed,  6 Jul 2022 08:46:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2012C11299B
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jul 2022 08:46:57 +0000 (UTC)
Date: Wed, 06 Jul 2022 08:46:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1657097213; x=1657356413;
 bh=zSzGaG4A0YRrlDcbTcQyYIHbV3KPHOmVZrsrgK7OdjY=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:Feedback-ID:From:To:
 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID;
 b=GWZaAdhxWryf6bebEGtLmFJJ7Yh+4BU1BObP5jqdRMwBYpzfm+vi277G3b4geVVQd
 GdqNx7QCEQLdbohpHMG7UAz2+2cr3IPehLL49HNV1KDNFT/y6vpZFCLSZsHLc5+xCf
 BIGZL/gj4vWX9IZsGqwCVcYkdpyHwQF2RD+KBfUPAZ6ACth2Pyv2HsHsoXDTuQzU6S
 +po3A/D5c7PdtLVa2rWR5isLKGaL8D0cGYKixS8cHOUuUgk54kc0LQ328663HaKRkY
 EtEjzcGWO13YgHHPjbgJdIAH6qrhCs2MFdB95z7FhpP83ej0Xr4OewuRuZR/XfsMyh
 /GjSTdWkOrozQ==
To: "xorg-announce@lists.x.org" <xorg-announce@lists.x.org>
From: Simon Ser <contact@emersion.fr>
Subject: [ANNOUNCE] libdrm 2.4.112
Message-ID: <N6wN_pLaLb9bNRiRuqGgMtYY3o0_fpRQOdTcR_YevDCbdvt3UhYCHOUpfdan5teHnP8ROh3k5i1ui7ggw6qDySNxO2VzLoxR9LAbtoOfHu8=@emersion.fr>
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Saleemkhan Jamadar (1):
      tests/amdgpu/vcn:vcn encoder unit test

Sathishkumar S (1):
      tests/amdgpu: fix decode test failure on VCN2.5

Simon Ser (6):
      gen_table_fourcc: strip _MODIFIER suffix for INVALID
      xf86drmMode: constify drmModeAtomicReq functions
      xf86drmMode: introduce drmModeGetConnectorTypeName
      tests: use drmModeGetConnectorTypeName
      xf86drmMode: introduce drmModeConnectorGetPossibleCrtcs
      build: bump version to 2.4.112

git tag: libdrm-2.4.112

https://dri.freedesktop.org/libdrm/libdrm-2.4.112.tar.xz
SHA256: 00b07710bd09b35cd8d80eaf4f4497fe27f4becf467a9830f1f5e8324f8420ff  l=
ibdrm-2.4.112.tar.xz
SHA512: df8a207d9cce220ee2cf67877eda65394733fbfd0ff85fdbadb2b20ba9bacc41421=
b32452506c8caecddaf8361564ca68cd6c74d4faf3b1569ab30a3243e4340  libdrm-2.4.1=
12.tar.xz
PGP:  https://dri.freedesktop.org/libdrm/libdrm-2.4.112.tar.xz.sig
