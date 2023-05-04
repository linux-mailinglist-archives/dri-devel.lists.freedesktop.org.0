Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B844B6F6C8B
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 15:02:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D263710E4AD;
	Thu,  4 May 2023 13:02:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 501F510E4AD
 for <dri-devel@lists.freedesktop.org>; Thu,  4 May 2023 13:02:42 +0000 (UTC)
Date: Thu, 04 May 2023 13:02:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1683205358; x=1683464558;
 bh=zRwWsMDd5Kf2yQpedEA3Ka2dLpgNvYvwuOL0uYq4mxY=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=bMEB6o2HJWxxoEqNdwwdW0BNsAgFv0lNhCC7g19PjyuYfm8vWLQwPT6ktUqMT9efX
 kzGJb/B6DRd1v/chuqHI0sYqo9zksPorj8wpdURJTDAR9YW50/LhMYGFPhM3Go147C
 OBTJnF95VXNoLn8S4/NyFyrNhMZ9Vdq7ZIPSZ517G3+oKXRJOs3fdXwqpFAzi5qZWN
 sorpsn7R3k5Xs8ojxqhmtTgN1fBC4VoDB1rHJCMHBaTZ9tsNQbuWxMy21aTxxMp2yU
 MnXiotKKgBSFwEdRG3jPkrGBu24wVBzug4eYmT5y0Vsk/N94hrPw8Lsdv18QS/Unu7
 aA926y3CU5p6w==
To: Jani Nikula <jani.nikula@intel.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/connector: document enum drm_connector_tv_mode
 DRM_MODE_TV_MODE_MAX
Message-ID: <xAFAkPUUOOBaOeo-gUC5Cie_-c8lebcFKZD7CYPMIJP_6fy8dla0m68EYtWtQAAayuNIftrpBJkHFEHJaUrV-MyO_xJvWiErwJ2NAkQuLMA=@emersion.fr>
In-Reply-To: <20230504123444.1843795-1-jani.nikula@intel.com>
References: <20230504123444.1843795-1-jani.nikula@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Simon Ser <contact@emersion.fr>
