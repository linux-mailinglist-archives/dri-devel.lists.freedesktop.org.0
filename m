Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1AAC291005
	for <lists+dri-devel@lfdr.de>; Sat, 17 Oct 2020 08:09:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D6D76E19C;
	Sat, 17 Oct 2020 06:09:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B42F6E19C
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Oct 2020 06:09:04 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 0F7AB8055C;
 Sat, 17 Oct 2020 08:09:00 +0200 (CEST)
Date: Sat, 17 Oct 2020 08:08:58 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v4 0/4] drm: panel: add support for TDO tl070wsh30 panel
Message-ID: <20201017060858.GA2242298@ravnborg.org>
References: <20200915121912.4347-1-narmstrong@baylibre.com>
 <9f720791-2718-205f-d101-0811a679f54e@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9f720791-2718-205f-d101-0811a679f54e@baylibre.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=fu7ymmwf c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8 a=Gz7jjY5onqyk-6-21tUA:9
 a=CjuIK1q_8ugA:10 a=H9xpq_V2WxwA:10 a=QYH75iMubAgA:10
 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: linux-amlogic@lists.infradead.org, thierry.reding@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Neil.

On Tue, Sep 29, 2020 at 11:25:17AM +0200, Neil Armstrong wrote:
> Hi Sam,
> 
> Is there anything more to change ?
Sorry for taking so long to get back to you on this.

All patches looks good and are:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

I assume you will apply the patches.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
