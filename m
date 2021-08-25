Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C50D63F6FE0
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 08:53:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E222890AD;
	Wed, 25 Aug 2021 06:53:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.protonmail.ch (mail-4317.protonmail.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79194890AD
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Aug 2021 06:53:07 +0000 (UTC)
Date: Wed, 25 Aug 2021 06:53:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1629874384;
 bh=A7RFIq2XpqCv1ytzHU1aqL/xv4IIK2KAP0GVR+SlGZI=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=jERioMWGy7FUwoFiqovD31/0Ir/p01TeMZg9WqCqyznq/Kk0VaDnamOFTPYTHJ2TT
 Vi+6IKN6CYy8t+suFplspWq+3oTSKmU94shZSogDW41/yZmvEGVvQ2k+GobpUXTcug
 sLQoCuzOGjCWV0HOiP/T2F5XOlQ9sIPyU99xlwOZEtozgYdOZJskYJyyNCOfBk7/j+
 oksELyflUxX1oxUZVsJq3RkpouWh+sHcidyhZbyctVFvuoxNAR5fq7zFgXJI63giMx
 7F3h+00VZ4HmDcphpUhP2xvQrxaG4+eitWZxOE//scGI4ItsKtCOojw/zmO4giuxyr
 fLA5qHZn/k0fQ==
To: Matt Roper <matthew.d.roper@intel.com>
From: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org,
 =?utf-8?Q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Subject: Re: libdrm commit permission request
Message-ID: <Yyp2kbGNFLL_WaiIZQP4Ry-KAgp-15ULOIR6jpA5-zT6-fw_MAw-EdNcAva6B_Sc8mLv-1NZ8cL3_NS54H4G_6efCFRtLqfO2_eFRWPIJlQ=@emersion.fr>
In-Reply-To: <20210824210931.GQ461228@mdroper-desk1.amr.corp.intel.com>
References: <20210824210931.GQ461228@mdroper-desk1.amr.corp.intel.com>
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

Maybe ask one of the maintainers/owners listed in GitLab [1]?

Please make sure you're familiar with the contributing guidelines [2].

[1]: https://gitlab.freedesktop.org/mesa/drm/-/project_members?sort=3Dacces=
s_level_desc
[2]: https://gitlab.freedesktop.org/mesa/drm/-/blob/main/CONTRIBUTING.rst
