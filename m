Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B0A690816
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 12:58:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D82A110E9E4;
	Thu,  9 Feb 2023 11:58:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05A6110EA9E
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 11:58:45 +0000 (UTC)
Date: Thu, 09 Feb 2023 11:58:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1675943922; x=1676203122;
 bh=KSWdqf+wtBrsUloT9j27Hqj7aUM0mU/PcRGgN30CiIQ=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=X+N1dzxNFlobd7LsITT5nalzCoqxnePg6d+D4j+QNZs8h89un8/VNH3WhzDb917XL
 bOuOBpD6ZLLeQSX9kLXdtPSeaFX5l3b5pNizf8IueTJ/BsgQEWBTHaTeQYrLBs5lgb
 31s24c6U1A7BvNlaD94ZgPNJmTbE5mrXf0gMLs1E9ntcgyWYfcq1bag/+vI5YAs25e
 z6O0t4+igKIdb9yyVPcUc6tynkPlWa4J2FQPYBjqoC7a3cPeQCzruL6lU2vUetTGGt
 lLGplZo6dCreD+JidjzpDLQlbDRMexqj+Mrmd/vTgpGRUyvbrb0fgH68GLxjSzZWj0
 fOkZH15D2gQ2Q==
To: "xorg-announce@lists.x.org" <xorg-announce@lists.x.org>
From: Simon Ser <contact@emersion.fr>
Subject: [ANNOUNCE] libdrm 2.4.115
Message-ID: <UF-RWmRa1UMTmmI-TaWkfpqR5JBEz6XFya9LRPLs-Foqxs1bj1pp6OXKiIE18wY1hdgQWfqkkSeI5i9HdzUoqbT4OMxbKnGgaBLkyjfrqoY=@emersion.fr>
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

Alex Deucher (2):
      amdgpu: add marketing names from amd-5.4 (22.40)
      amdgpu: add some additional marketing names

Lang Yu (1):
      tests/amdgpu: use AMDGPU_TIMEOUT_INFINITE to query fence

Matt Roper (1):
      intel: Eliminate need to keep adding PCI IDs

Philipp Zabel (2):
      drm_fourcc: sync drm_fourcc with latest drm-next kernel
      xf86drm: Add support for decoding Vivante format modifiers

Saleemkhan Jamadar (1):
      tests/amdgpu/jpeg: enable unit test for jpeg 4

Simon Ser (3):
      xf86drm: fix warning in drmGetFormatModifierNameFromVivante()
      xf86drm: add support for printing AMD GFX11 modifiers
      build: bump version to 2.4.115

git tag: libdrm-2.4.115

https://dri.freedesktop.org/libdrm/libdrm-2.4.115.tar.xz
SHA256: 554cfbfe0542bddb391b4e3e05bfbbfc3e282b955bd56218d21c0616481f65eb  l=
ibdrm-2.4.115.tar.xz
SHA512: 0c38d3cfd76f627b899f052527c2939d5fc87a417422dceb0761839ba21e6973670=
3a87ba170b5ba7a4aca2506a240760c8c97ca1781a7fb78468225295293bd  libdrm-2.4.1=
15.tar.xz
PGP:  https://dri.freedesktop.org/libdrm/libdrm-2.4.115.tar.xz.sig
