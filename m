Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D5334A5AE
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 11:35:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37C466F3A2;
	Fri, 26 Mar 2021 10:35:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail2.protonmail.ch (mail2.protonmail.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 022786F3AD
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 10:35:48 +0000 (UTC)
Date: Fri, 26 Mar 2021 10:35:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1616754946;
 bh=zDa9RoiGoAZjzSC/JI97cgR1TPFxUcup2zzGsmMcNWI=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=tDFcBzFe/eV+bvYPSVRCRsq+TCQZ/foHLUO17yZ3Y9r3yZf/IHNhv1Q1VQxCYWWrf
 bJR0rXvJyycZhi5cIphxmXC4mrphxuCNerVUR9UEk62hedLmteCrAyK60sv1AmrA5+
 wElXdtmx/hWsGd+HkH+X+O14E1LdOPn3MVRCN6t5edk5+Z4ZbGnMPdJ/Jk4TSxx6iJ
 8+6fv51WxsU5E0432W3b8CXGzPkYEFC1cbPrEBefY9RXHwtjOli0GjFRzu1bKtPfGa
 fa6C5q1aPVLKCq/EHwYpH2cYvlHMRp83Sxln/3QBnsiwM5zSHtemmLRA6UpUTm+FNB
 Ux4HwTKDZoLvg==
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 1/2] drm: Fix 3 typos in the inline doc
Message-ID: <BfA-piXji9BZRHnRUxveUb-SF8mAW5piyHW8fZT5o2xy0g-z21gO2Gyu2Iw5pUX7v2K1NpELuornJXEFtH8kBPhDfJFyWsyee4rol2suPZs=@emersion.fr>
In-Reply-To: <20210326103216.7918-1-dafna.hirschfeld@collabora.com>
References: <20210326103216.7918-1-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
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
Cc: airlied@linux.ie, dafna3@gmail.com, dri-devel@lists.freedesktop.org,
 laurent.pinchart@ideasonboard.com, tzimmermann@suse.de,
 enric.balletbo@collabora.com, kernel@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Simon Ser <contact@emersion.fr>

I'll push this shortly to drm-misc-next.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
