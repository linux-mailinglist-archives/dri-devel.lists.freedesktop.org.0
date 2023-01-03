Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA29565C650
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jan 2023 19:33:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B3A110E3F0;
	Tue,  3 Jan 2023 18:33:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE68B10E3F0
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jan 2023 18:33:14 +0000 (UTC)
Date: Tue, 03 Jan 2023 18:32:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1672770792; x=1673029992;
 bh=lF1ZZZIpT3OIhDQV4rDEZUO9kZMTsCJn4fUJlYE/RIA=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=Gx9boDGZlHD+ya+Reb8SdVMdhS97tK1TIUCMGj8cG+zFITWaGRmHo6kIelUMiLgKN
 RnbN1uIkWjAolGDuIS383O1dTJOdgIPbGAIZTDLJEp87FY8SLJLCG7wr8iiLzYvfeK
 bC1r67X/MpYV0dMSRx3RnPgVuExkcc8Is93xgOP76yzGyDijckzG01GXKdd55+QU/6
 PDtpsiQCoPJMwWFGBrCXqwQbAAajgAKsrqAOEc3IzvSVy7YMSSwGHKF7E0G0AVfJJd
 ryLs22cWy2ll75svOHTZ1Mc5bOzfNP1cvMnt7LZI33ESLcuJnoGCXY3qqv6AATeB0k
 27cb6enofBnKg==
To: Sean Paul <sean@poorly.run>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/docs: Explicitly document default CRTC background
 behavior
Message-ID: <aM3aLd9cDn4gsHtm4RNuQvCtKBUwXF7Fv3Blvo14SamrerqT8UVdCwYxtcKTp_BkPq2ddrA1iFZt6fLRqiosbhNMFWLUPrSpKk3V0N8UC_c=@emersion.fr>
In-Reply-To: <20230103152738.1213785-1-sean@poorly.run>
References: <20230103152738.1213785-1-sean@poorly.run>
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
Cc: Sean Paul <seanpaul@chromium.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Nice!

Reviewed-by: Simon Ser <contact@emersion.fr>
