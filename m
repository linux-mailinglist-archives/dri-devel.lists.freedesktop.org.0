Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A8A3A5DA3
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jun 2021 09:23:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5441289CF8;
	Mon, 14 Jun 2021 07:23:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C54C89CF8
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jun 2021 07:23:02 +0000 (UTC)
Date: Mon, 14 Jun 2021 07:22:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1623655379;
 bh=dJZln88lN2ZOtbXwmt+yMlSaTT1Nk8VC901yTzLI2ig=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=JDq9h0uEPFD6gUZ2AOzL9bP2pU5QuLhzovduL5HtClpmjKVRCQ1JO8WCcsHZYts6O
 d36ZmVp62oYmMX+K5XNpIyPaKya6+uiwFs+8C5L1p3Dk2yYX1TRryoZls2jj5iDED3
 CQMzoNNW5SxUkss+bROTqSzcXBZ4yL0sXbOAZFKB2LNRS1lDLc9ecHl/zX+Z2IufcT
 Iws914ONUzQF7myy9tQydWEAGpNxUcufR2C0YuKqoe4Jwyf3fCujmGSu7ZGEVTzcRm
 WS98GHqXAVStsXb1hSxLGBZR6D2nB7ELOt0Fp15YXd4iVQu0HZXoHwXXQMAmOfSIPW
 0bqc6VF+eR0AA==
To: Pekka Paalanen <ppaalanen@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v6 1/1] drm/doc: document drm_mode_get_plane
Message-ID: <Wdnus2VjuHZ_F0qu6yxOhNad7bpq9yeQzJtaydJU9BLwnlEeDPBsYbGLNtn56ZcC4KrvwbR1VHAF4GAFTpgV2C0uzHTmWIDUZKqiCvf6258=@emersion.fr>
In-Reply-To: <20210614101430.02901892@eldfell>
References: <20210611213516.77904-1-leandro.ribeiro@collabora.com>
 <20210611213516.77904-2-leandro.ribeiro@collabora.com>
 <20210614101430.02901892@eldfell>
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
Cc: airlied@linux.ie, kernel@collabora.com, dri-devel@lists.freedesktop.org,
 Leandro Ribeiro <leandro.ribeiro@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pushed to drm-misc-next, thanks!
