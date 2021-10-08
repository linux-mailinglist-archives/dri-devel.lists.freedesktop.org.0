Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3072942709B
	for <lists+dri-devel@lfdr.de>; Fri,  8 Oct 2021 20:14:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26A256F51C;
	Fri,  8 Oct 2021 18:14:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D69B56F51C
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Oct 2021 18:14:24 +0000 (UTC)
Date: Fri, 08 Oct 2021 18:14:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1633716862;
 bh=BhsA1aKlglGjpRdMu2peVecDmERAuTyLLhI53Hw2hvM=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=NOhM4xtz90A+U5fTcAvceuaOBBdeDfqHVRIxTAAAWJDGR/QCmgPSMeKzmv8tLCwqO
 AtKKcThPvlqaWcny7YRWKKPr+npe027hHR5e6T8ulEqY5eR85lAiNTWKS1qiwFMUBD
 zFdZ0LvL0hpb8BhAnGIb8doLhJ8oILi1tXObedngR3ZsuV2qdH5SOLpGOKP8dfHy7t
 sqm7gx/B9i+3369jsG+SIUj3eYjLX3Fkyt0C1P3ApSfxcwSkcOjgYlzO7QRQkMKmII
 6FNOQwRwhetgY/+RsXzv/Z6hdSkI0cZMiYylxNiw+ltmOgDXW5OG+cs+Ph0W5tnY1V
 4vpaD1iBJX5HA==
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Cc: harry.wentland@amd.com, alexander.deucher@amd.com, michel@daenzer.net,
 pekka.paalanen@collabora.com, daniel@fooishbar.org, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v2 1/7] drm/sysfs: introduce
 drm_sysfs_connector_hotplug_event
Message-ID: <YjBu36cgPhB1Mp597TghjDDoO0mKv0pUBPn9e1RNjC_wbBgcTm7emTIPnFidE3SuvjvWMBuOjSthILB1qB4UrbCTgClb2Q69ysb1KL-rvCQ=@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,TVD_SPACE_RATIO shortcircuit=no
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

Ping
