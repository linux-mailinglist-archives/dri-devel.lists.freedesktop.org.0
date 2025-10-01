Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3789FBB0A42
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 16:06:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D60610E1ED;
	Wed,  1 Oct 2025 14:06:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="fvokiHXI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-244104.protonmail.ch (mail-244104.protonmail.ch
 [109.224.244.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB14C10E1ED
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 14:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1759327505; x=1759586705;
 bh=yCkyXABvfPbYcu5CAHE3jDiZXmbFgpOxAl8UVf5dtP4=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=fvokiHXI0gfmy+GUI85ctSkSP00U1hVYxs/A2b6u/jwIa8g/f9ov54X2pplnmT9c8
 63H5FSdJeIxE2A0NfHqUt1CxMhR7v0/cG+DGVi8QT1+Te5QVQGeZ4U5xz57+s+bJaF
 X27TdmtB6PbFOAB8BUorhHkYsln6JQ0t1zzu7U+DziqXbJU0MMkCOVPHHiwbqpiq3F
 FTP3Zfe4Nlul3uNRHsHY8h01ncF58f9Te79XycY5bRxgJX3PJVJhIC471YFojAv4ig
 GRKmjq3/h4Dp79t4nYTP/9n43XuPASvmhH+Uc1X9mdOdmXi5R/tMG23LUlK4bMFcsv
 3simKyktk1VlA==
Date: Wed, 01 Oct 2025 14:04:55 +0000
To: "xorg-announce@lists.x.org" <xorg-announce@lists.x.org>
From: Simon Ser <contact@emersion.fr>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [ANNOUNCE] libdrm 2.4.126
Message-ID: <YfYKRut46CEHnN22mtOVVWWPVPb9dmyQSeOPiy2Q8x9iIeFoDm8_-ETAkb3CExohUWGQzd412agusLwhjZk0Xrz8-0ljr6QsFxtS5eaADlw=@emersion.fr>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: 87deb0d9087826dea8358bccc2917d9fe9ee73b0
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

Emil Svendsen (2):
      modetest: util: pattern: add new patterns
      modetest: util: add seed argument for noise patterns

Huang Rui (1):
      modetest: fix build error on is_power_of_two()

Jesse.Zhang (1):
      drm/amdgpu: Add user queue HQD count to hw_ip info

Jos=C3=A9 Exp=C3=B3sito (1):
      xf86drm: Add faux bus

Simon Ser (1):
      build: bump version to 2.4.126

git tag: libdrm-2.4.126

https://dri.freedesktop.org/libdrm/libdrm-2.4.126.tar.xz
SHA256: 6cab16d4d259b6abc9f485233863454114a3c307eca806679aad3edbe967bf42  l=
ibdrm-2.4.126.tar.xz
SHA512: 7cf2e2904025165562f0bf56faa57f3c3cca6f739c2afc299952bcb7bb1dcb86554=
c8060a7dbe070f2100d036b0ece615e0a55d9df00885679ae30b7e6ef0f0b  libdrm-2.4.1=
26.tar.xz
PGP:  https://dri.freedesktop.org/libdrm/libdrm-2.4.126.tar.xz.sig
