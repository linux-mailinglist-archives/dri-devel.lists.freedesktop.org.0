Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EEF8652FDF
	for <lists+dri-devel@lfdr.de>; Wed, 21 Dec 2022 11:53:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A102510E0E0;
	Wed, 21 Dec 2022 10:53:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA6AA10E0E0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 10:53:25 +0000 (UTC)
Date: Wed, 21 Dec 2022 10:53:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1671620003; x=1671879203;
 bh=38K/ZcU/rpkZ40zlfd7cH6/N8jRFFqZ+s5+dWSD7f/0=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=VHUQSi1j9kqEXv5+fsZK5WHUssbse4nWsMCEA8ZJfJJWSZqanCgXanb7xVHT1ugDU
 1ETuiSQ4F+OKrn8ne5ILCOUCNkkADuq5vbmdFb4XqjdU13zvT0czz/NyvZCJpLXIzI
 BhjyN1/UfMHmSqTEf2ep3YvoJfddnGtcCMwNhDGDvLj3RzdBtq3i8qICZHlCmHdtH9
 BXJ1jTwB+rRg4jhTa9DrMMBmfnAfg387k12MVYzkHPO5+5eJJhwkIm609/T8n9/Lac
 MpThZbAs8dVsIc5Luh4xhB65utL29/rsGgtvmcEkUqFNkDhgw759NgshlzI7kBX4xn
 VZqLAOjNlxFdg==
To: Siddh Raman Pant <code@siddh.me>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 10/10] drm/drm_lease: Remove usage of deprecated
 DRM_DEBUG_LEASE
Message-ID: <hcCVdh5zwsAppV-NZm4hkeNpG5TRbMLAq_8vzt33GZpXE5VS0HSLH1_SRz_7FwI3rJugI1JevfKExAY3Y1tFUWi_T0GpdykLqN8cBp7-c9g=@emersion.fr>
In-Reply-To: <3097218a132d9184e82b2f9b9861161b1dd99db5.1671566741.git.code@siddh.me>
References: <cover.1671566741.git.code@siddh.me>
 <3097218a132d9184e82b2f9b9861161b1dd99db5.1671566741.git.code@siddh.me>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Patch is:

Reviewed-by: Simon Ser <contact@emersion.fr>
