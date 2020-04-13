Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7F61A6F5A
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 00:38:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C8A16E158;
	Mon, 13 Apr 2020 22:38:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch
 [185.70.40.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15A7C6E158
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Apr 2020 22:38:42 +0000 (UTC)
Date: Mon, 13 Apr 2020 22:38:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1586817519;
 bh=/i0i96IdUaQ3ihlTB/omxKFetdxguDDuV/9jWJqxpvs=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=us5Ux0YdteYJOp2AKu82ZcBn+yWz/Kpvfvqlm8HutOGeAcBjIAlvXg5zbq/6OUUUG
 ZklRcwRxEVAu03IjxJHh7hBvuwWztYZUy6W0q6TjyTzbw4+jK3RulI2sUJxN/PSr8Y
 YMRq9RvEJoTfMoLvitP7uzUd+Y+I52IMvCxVyef0=
To: DRI Development <dri-devel@lists.freedesktop.org>
From: Simon Ser <contact@emersion.fr>
Subject: Re: KMS enums and bitfields UAPI
Message-ID: <u5X6K68v0waX25yZHLng0H_WDIFjNU-MgmnbLCoBZN7bqys3ofRm203wrYKdMnR1f4CStz3q5a12Y0ou8lCZWNMuhRmCCZ1dkTCSuDZjdy4=@emersion.fr>
In-Reply-To: <VmzN-pGfjaXAFb8aZXOnS2ibasRIsvB-EbfvxyvjLs07m-PBv4pTcX5hsB7yyrt78pxQQ6Bbu3I-hTtFSXEadxm8CkS60FLccIsZycguSfA=@emersion.fr>
References: <VmzN-pGfjaXAFb8aZXOnS2ibasRIsvB-EbfvxyvjLs07m-PBv4pTcX5hsB7yyrt78pxQQ6Bbu3I-hTtFSXEadxm8CkS60FLccIsZycguSfA=@emersion.fr>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Daniel Vetter, Ville, any thoughts about this?

Thanks,

Simon
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
