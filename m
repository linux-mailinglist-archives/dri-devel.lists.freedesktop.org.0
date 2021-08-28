Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE883FA6D6
	for <lists+dri-devel@lfdr.de>; Sat, 28 Aug 2021 19:01:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5F176EA67;
	Sat, 28 Aug 2021 17:01:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1EDA6EA67
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Aug 2021 17:01:29 +0000 (UTC)
Date: Sat, 28 Aug 2021 17:01:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1630170087;
 bh=m4z6gVadcGbVtyF3I8oWXqiPAQ5Cu/iRMHvkRQTz0Fo=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=m8Hjn4X01ayX0TuUWqvV5pC8ZIRL3TQew3+SG+bucXjNHB8fHyG/uYYaP/Mz/T5sm
 sPiNIajIghLJBOLtHB930cmUHT4NtKOiD65jg1tzXKWEmaOH6n5jJPF2y9GVzXgnNE
 y/3RHjOd6Xpc1ybGnmCp/4F+1hKwnt6gZgQehuXkvXKFaSWH78pjCKsPQVBZwTXRcM
 OWFu0msrdNDxBLR0tFrCfuN0hSiAuBcPP4TTVhtQ2QtlGO+/xZ/YIv1dpRIbPDUIRn
 d3lV7CGzlay3sMvd6Ij4rZpZYKX1E/tg28akJXHptZXfxloEoIkLKoK9Q+zmkNRQ/z
 EQo9ySFy7+zIw==
To: "F.A.Sulaiman" <asha.16@itfac.mrt.ac.lk>
From: Simon Ser <contact@emersion.fr>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] GPU: drm: fix style errors
Message-ID: <AAXPzlqQa4LEHiBG9xMqCJ0pITmtdyx_lOfTKqWVGLouvv4I9Xt05XUcAeTi0LE6EwvBjeA5yWuQxDLfoXT9eTl1PyJhw-TBT4muamOjv-s=@emersion.fr>
In-Reply-To: <20210828123942.1556-1-asha.16@itfac.mrt.ac.lk>
References: <20210828123942.1556-1-asha.16@itfac.mrt.ac.lk>
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

Reviewed-by: Simon Ser <contact@emersion.fr>

Pushed to drm-misc-next, thanks!
