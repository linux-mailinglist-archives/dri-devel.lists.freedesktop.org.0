Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0568A61F98D
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 17:25:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B93510E497;
	Mon,  7 Nov 2022 16:25:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F18F310E499
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 16:25:31 +0000 (UTC)
Date: Mon, 07 Nov 2022 16:25:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1667838329; x=1668097529;
 bh=U0MZUFxkg3+UOPqNFrbWaEyCbKpVVLhO0H5Klvvg8Vk=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=Itnu9cz9j7TDTfpSPHRPvw1J4NuVaix58GOgEYOp1MnSRFGn5CxGoFPG8LHLDOk7q
 VkHbbyF2F88SWp4IRgL8HrmaUgTAaSVhfs3Bu18IYfFES3nt693fBlT7XSB/XUdvuH
 A/uuUC1wDxzNvrEy+gQgt7l7GIpbwsiW+OGvluh75J6J9FG+SJlpCMYlBqEiMuDAjw
 RzPRXUH1sJAfLBnlRJ3ctG3dR3/OAO/wc6wVvxThwrYCVNstUh/KSeYXgttha2++/M
 5JFt+Ozg5FxD/JYqWBfPIi4YLlkOXgAU9atjOEs0smy1HgraDyeVN0o06b2avVoPHJ
 +MCRjNALW0QLQ==
To: Hans de Goede <hdegoede@redhat.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: panel-orientation-quirks: Add quirk for Acer Switch
 V 10 (SW5-017)
Message-ID: <Dof30Pzm13KfO-sBOxwONjaxlKegBySDSxwZQskDiQVWp5pjtzRPZ6-9cBSzI31sKehiOQnbh1W1D-1TOTMj8nXm2tSMerJV17EatnajpiM=@emersion.fr>
In-Reply-To: <20221106215052.66995-1-hdegoede@redhat.com>
References: <20221106215052.66995-1-hdegoede@redhat.com>
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
Cc: Rudolf Polzer <rpolzer@google.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Acked-by: Simon Ser <contact@emersion.fr>
