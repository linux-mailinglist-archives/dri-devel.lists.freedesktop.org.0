Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E54565447E
	for <lists+dri-devel@lfdr.de>; Thu, 22 Dec 2022 16:43:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63C1B10E0AA;
	Thu, 22 Dec 2022 15:43:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4022.proton.ch (mail-4022.proton.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EF3E10E0AA
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 15:43:43 +0000 (UTC)
Date: Thu, 22 Dec 2022 15:43:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1671723819; x=1671983019;
 bh=o4JeQC4lgkRxJjuokfNcEDFkwXkl10oVBWPrONTTxh4=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=OoNghi9wVe65hydZTHIjymohs4EMmhq55Bts23s4Uu8lj+7Fy1JZ1OEWUuONaKYJX
 h3M8aoAMSSuD/QFj/a5E7dF+bT3F/kk1kjz5qi3OotxyN4FZKkdUY5WEE0uiFF1KnV
 /9De7mKtx50IVmPgMD8lOQG1vp8umZ4/NeRIqRDHylkMYd0qBd1id9AUOgnhaA3vM+
 TlRBSYpSjUUJzZAy3H7yz4i/q0G1dIBaSXxUUcxrLSpGIn44EsMXjIOhTh6GqbBU3y
 xojRmRuLE4dbKNsrlEYoV2w8iJ8HzwTcgr+Dg6DlPmtXCMeNbbjce3As+koosq7vtC
 EwL5k3SNKARWA==
To: Siddh Raman Pant <code@siddh.me>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v2 7/9] drm: Remove usage of deprecated DRM_DEBUG_PRIME
Message-ID: <WQPlQmSRlNYiwN86XBcaxDTo0r2rDi28CRLzZszXS2IRVoKrqt44xkUXYW21GifuV_p67kKf1q0NYwsC1qYWn-LwOKwFNq4aEMX3tHlpHQ8=@emersion.fr>
In-Reply-To: <e7b5b54ebfac4ba53cd95174b81d3f3169a4d630.1671723195.git.code@siddh.me>
References: <cover.1671723195.git.code@siddh.me>
 <e7b5b54ebfac4ba53cd95174b81d3f3169a4d630.1671723195.git.code@siddh.me>
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

This patch is:

Reviewed-by: Simon Ser <contact@emersion.fr>
