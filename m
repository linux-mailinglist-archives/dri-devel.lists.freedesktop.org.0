Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CE5402610
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 11:16:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5833A89DA9;
	Tue,  7 Sep 2021 09:16:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B603189C88;
 Tue,  7 Sep 2021 09:16:14 +0000 (UTC)
Date: Tue, 07 Sep 2021 09:16:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1631006172;
 bh=kb+kPQrQ0XOUiHCLlMhIRUuVEoyp2oTFgoWLLWS5944=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=GOt3t+4li9I7nI45sPvj7K7hWjJycfLSx2Jwj/5xlOePb4qVgyAYVy18TpPWZEPOk
 cKdfFOs1afgalDVzhKVb6JEC8lFXtRjo2no3/9Ny8Gy/AAqXa07Z6tCDf8xcKovvGL
 LNY/TaRfvo6e+15FxBUNt6yhFmrAYSM9PC4y280dWKkskWnYO0rp6Qyvw8NPbWsGEV
 sUWw9WVFkigNbSRCoMsMO+M9lS1bF3yl51/+ZK114/N8ky4vKNasAF7Sy6CFapogP4
 VI14O6Gvr5SAeTOkgiHVIYimnSsZHtghEv0jWIwOUxpEEbv7Hnq5ul3hJOp+o7ab/E
 IXS+cupywY46g==
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Cc: harry.wentland@amd.com, alexander.deucher@amd.com, michel@daenzer.net,
 pekka.paalanen@collabora.com, daniel@fooishbar.org, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v2 0/7] drm: add per-connector hotplug events
Message-ID: <K_o7SuToYSYL9tTtvLoykIFhHGamEksX-WI1P5skYeWJqO55oOgKurPlx4Ix0xl0PEpVVdt7xQPWM4MbpihIQ2B__rVyB1thiTTXmmcQ7mk=@emersion.fr>
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

Ping, anyone up for a review?
