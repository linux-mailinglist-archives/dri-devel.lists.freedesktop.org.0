Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC6F82CAE3
	for <lists+dri-devel@lfdr.de>; Sat, 13 Jan 2024 10:40:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C072F10E093;
	Sat, 13 Jan 2024 09:39:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B19E10E093
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Jan 2024 09:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1705138795; x=1705397995;
 bh=whCoIEz3FlstTriWBYgMiPXRgSeZqHfKS7CnvRFy1XQ=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=Fv+sufLRvRwH8jQXAxaZMsoAL1AXQm1CTwhHEZWd2OcX9CLKwumUzJtdyxQRFRvBe
 mixKA519gvHsswYiKNav3sLlvSP8Re12dZR0q67PGd7UdfXi5fLgjU9Ipw/THFazg8
 8QhlUImsqtmg2qs4OrOuU0aPqWpYuTSSHUlKUfyxk0Zp/vnLAHe9MpNYyFUTLbsv6m
 95J4iX25wJ7FMdHrQAC3UMyhwCqqizGSXDKY34MSESpdK2fEgCPMZbHG9BdVoMw2gW
 o1b4BIk8qV29AZgwf+oJcyb8SrYyFFfhoqagzng68DA5HJCshCP3xTaXRr7NBYBiYO
 oCxhcoyuTrBVw==
Date: Sat, 13 Jan 2024 09:39:45 +0000
To: "xorg-announce@lists.x.org" <xorg-announce@lists.x.org>
From: Simon Ser <contact@emersion.fr>
Subject: [ANNOUNCE] libdrm 2.4.120
Message-ID: <0OxO9dG8wSwszEqsviqH-C0Hr4DXyzMp05gJzArgZ2J8bWJf229f_g_7VxEJjlqeV3jHz26miYCFPXRUggVayc9_lEQ-HXOWMvjafPm-wTk=@emersion.fr>
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
Cc: DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Eric Engestrom (1):
      radeon: fix missing stencil_tile_mode initialisation in the linear/fa=
llback case

Pierre-Eric Pelloux-Prayer (1):
      amdgpu: fix use-after-free

Simon Ser (2):
      Sync headers with drm-next
      build: bump version to 2.4.120

git tag: libdrm-2.4.120

https://dri.freedesktop.org/libdrm/libdrm-2.4.120.tar.xz
SHA256: 3bf55363f76c7250946441ab51d3a6cc0ae518055c0ff017324ab76cdefb327a  l=
ibdrm-2.4.120.tar.xz
SHA512: 6dc16e5134a669eeb59debb1dc2d15b857483ab7476dc2b94bd05a32d8953f046f5=
656f6cf9e1a63e97e7156fb65ebb58b6a29fe45cb6326058baaf820626e70  libdrm-2.4.1=
20.tar.xz
PGP:  https://dri.freedesktop.org/libdrm/libdrm-2.4.120.tar.xz.sig
