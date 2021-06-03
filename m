Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 027AB39A1E3
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 15:10:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF4396EE3C;
	Thu,  3 Jun 2021 13:10:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCA496EE3C
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jun 2021 13:10:06 +0000 (UTC)
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74]
 helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1lon6p-0005JH-Dl; Thu, 03 Jun 2021 15:10:03 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: dri-devel@lists.freedesktop.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH] drm/panel: add rotation support for Elida KD35T133 panels
Date: Thu,  3 Jun 2021 15:10:02 +0200
Message-Id: <162272579227.3261085.13967494579385351711.b4-ty@sntech.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <SN6PR06MB534253E1CFDEA6917230F57BA57A9@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <SN6PR06MB534253E1CFDEA6917230F57BA57A9@SN6PR06MB5342.namprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: airlied@linux.ie, thierry.reding@gmail.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2 Apr 2021 15:48:47 -0500, Chris Morgan wrote:
> Update the panel to allow setting the rotation value in device tree.
> Tested on an Odroid Go Advance, where the panel is by default rotated 270
> degrees.

Applied, thanks!

[1/1] drm/panel: add rotation support for Elida KD35T133 panels
      commit: 610d9c311b1387f8c4ac602fee1f2a1cb0508707

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
