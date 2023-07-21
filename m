Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E7E75CFDF
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 18:43:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C773F10E6CF;
	Fri, 21 Jul 2023 16:43:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8B8110E05A
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 16:43:17 +0000 (UTC)
Date: Fri, 21 Jul 2023 16:43:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1689957795; x=1690216995;
 bh=zRwWsMDd5Kf2yQpedEA3Ka2dLpgNvYvwuOL0uYq4mxY=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=BKvDzfuRz02dY3Ix66U73EbJWcFwvElCpuQGvWEK9N7aUnYKzfKQwkg+HRosyVkS+
 0u4PotY20p4oKxSXoRBd3/OJPYrQNNvs/3OStA+hofSgCY+zrAQiX8syQCUjHBjY5s
 km7XOI9jiNIyZwizws77NcNHwBaOnJMvNAbSrLdBpYD5tT/koyUZcShMipXWNFUlU+
 RFAAPkAJNWoJDU+1G3NMTFvtqd2yu9qjYpG55ReKG938nyQcUfgW5cHcueAL/uczq3
 0kAxZV8fDCcnAZaWZLn8gn75krAofQELXkOmzOk07hsZA2h5urMG8rW1oScJGc16Vm
 2N6gHN6P7aarw==
To: Erik Kurzinger <ekurzinger@nvidia.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v2] drm/syncobj: add
 DRM_IOCTL_SYNCOBJ_IMPORT/EXPORT_SYNC_FILE
Message-ID: <XVsg962Ap4ITm3jFnLJ5U_3hCwWDCsk_JYO3Q1PjPlwxn65h2BuhS72SP_pvynXMa0q4KxSJYckuK_nR9vCpmXh-hF_VDcigbIbAdSdOJ6s=@emersion.fr>
In-Reply-To: <a09e38a6-5ac3-75c1-eadd-38a265e0ae33@nvidia.com>
References: <a09e38a6-5ac3-75c1-eadd-38a265e0ae33@nvidia.com>
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
Cc: James Jones <jajones@nvidia.com>, Austin Shafer <ashafer@nvidia.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Simon Ser <contact@emersion.fr>
