Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F26170CB17
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 22:31:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C81510E28C;
	Mon, 22 May 2023 20:31:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.proton.ch (mail-40136.proton.ch [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D553910E385
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 20:31:46 +0000 (UTC)
Date: Mon, 22 May 2023 20:31:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1684787503; x=1685046703;
 bh=kvoa+shQVmnSaWmihgU+hm3Z4Z3MMR+Q48OAC0GcrSM=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=wDMeflZtyTFjNjBkl420czK8fKmvLvbjRspOQIjMOsPIgQLJGzoEjodwZCmuG+lh6
 RkxyBNk6NppRSAQcIRiLg42V+oNz595D9y318KmlU2+e/QebjXMilhRAh2Nb8DWi04
 0B1rBMmg4TtP02mLbJNd5OWhHMjUdrBICJT4r6mMljFyYMU7MNqTy1wNatV4ZPXvzc
 IAsr20GKnJJ69UuGQZWUXBMTvD/jrEUQo8kQi02qNhd7Y4dlvEAJ7nbXTKoVUJsqgM
 sIZjxUKXotbJCTuV4SWpM3KVAehJalIz3uSPP/nvKHlT6Vorfm+QzCE1S9UIVIq9Bi
 LYcy7o4iEb8iA==
To: Drew Davenport <ddavenport@chromium.org>
From: Simon Ser <contact@emersion.fr>
Subject: Re: DRM_MODE_PAGE_FLIP_ASYNC for atomic IOCTL
Message-ID: <KD5Hl9oOXST3Sd4mSEOVcbDl903jzc8-x485CYRm1ZUKbNxS7QIcg8l2TUF0pkYKJOAcBRIi9qIuNAwMVreUjObHlpKHVF4FbxPeW0Un8Ao=@emersion.fr>
In-Reply-To: <ZGu/MvxBpYqvvYSA@chromium.org>
References: <ZGu/MvxBpYqvvYSA@chromium.org>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Yes: https://lore.kernel.org/dri-devel/20220929184307.258331-1-contact@emer=
sion.fr/
