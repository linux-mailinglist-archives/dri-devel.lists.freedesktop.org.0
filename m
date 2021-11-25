Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A7645E1AD
	for <lists+dri-devel@lfdr.de>; Thu, 25 Nov 2021 21:37:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD6316E32A;
	Thu, 25 Nov 2021 20:37:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94E6A6E32A
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Nov 2021 20:37:33 +0000 (UTC)
Date: Thu, 25 Nov 2021 20:37:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1637872649;
 bh=chd0JKR4DpfjI9inJSMWC9e7PcQcOL27ENQSWS9msIY=;
 h=Date:To:From:Reply-To:Subject:From;
 b=w0R7PnK8GPxK34ayz/3XWg7vz99E/H3vGk2eOj6VkfTZMxoPgk3uROXhss/ZwCDM/
 TyD6bB8CYoVQsZEIwTmQrCRtO+yOod0HcozM2nzh0ZC2iIIk645egFUvei4NVxNduH
 1IX/r0J6M+KbNn2fKROrgoipPb+4K0jV4N2lu3AWYqCS2iTpHUXJKkZftk0K4tR8Nc
 1DdT0XnmOiXkkxGASP0gOmvFRsctlJQpOraZH6MRyeMW28xxKKoTHn5r0kBJ7kzd6H
 fuUKVPQUwRmxcahuntmQfEbhlqBM8fl5ikgbTg3+ZM4GyAYvAN0eheuVTcPtUzTT8R
 6r3QazciUY4Ow==
To: DRI Development <dri-devel@lists.freedesktop.org>
From: Simon Ser <contact@emersion.fr>
Subject: [ANNOUNCE] libdrm 2.4.109
Message-ID: <urI95C8i3rDv3_p1aSdF_KAKZztrre5lhhS6fHDoWgnU6Zfpe-LJetpPceD8aoFhjXi_e2LHPzFFxrYiCB6td02646NfhKq6bVBmrnDANA0=@emersion.fr>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Bas Nieuwenhuizen (1):
      amdgpu: Add new function to get fd.

Eleni Maria Stea (1):
      xf86drm: fix compiler warnings

Emmanuel Vadot (2):
      ci: Switch freedesktop/ci-templates
      ci: Add FreeBSD support

Simon Ser (2):
      xf86drm: add drmGetDeviceFromDevId
      build: bump version to 2.4.109

suijingfeng (1):
      radeon: remove duplicate declaration of struct radeon_bo_manager in r=
adeon_bo.h

git tag: libdrm-2.4.109

https://dri.freedesktop.org/libdrm/libdrm-2.4.109.tar.xz
SHA256: 629352e08c1fe84862ca046598d8a08ce14d26ab25ee1f4704f993d074cb7f26  l=
ibdrm-2.4.109.tar.xz
SHA512: 45194bb28207421afcff3e247930d2eeab77a5fea58e6be22f67525f2e0aab2f410=
a9ae0ab315b55ef56b80c481bba40b1660468b7cda539758b2bbb8e814fd8  libdrm-2.4.1=
09.tar.xz
PGP:  https://dri.freedesktop.org/libdrm/libdrm-2.4.109.tar.xz.sig

