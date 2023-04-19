Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9EA6E70C8
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 03:37:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFCF810E1B5;
	Wed, 19 Apr 2023 01:37:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 590E710E028
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 01:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=kaHMdFAtseWFy3AgpXa0OQ5r/GCD/Wq4MIRcfvKEg20=; b=X5gYsZIM9nxJfXXG+Ovc5A/Zd3
 ZNUKXftiOhTFwEGP07qD0Rb5hnM9FW/TEohasAxXY4TOJPAqkfTo5IOzrfI4YTBC5WduUHOdtG49U
 umSPJA51quiYO3P5TJpRXXpsy0YvOaKTyPgu3MQN1XYl81x9YMv5i/kOkIDxGM1pda8Y=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1powGb-00Aead-Vt; Wed, 19 Apr 2023 03:05:49 +0200
Date: Wed, 19 Apr 2023 03:05:49 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Justin Chen <justinpopo6@gmail.com>
Subject: Re: [PATCH net-next 4/6] net: phy: mdio-bcm-unimac: Add asp v2.0
 support
Message-ID: <7af226ea-3aef-447c-81b3-fa3576534b33@lunn.ch>
References: <1681863018-28006-1-git-send-email-justinpopo6@gmail.com>
 <1681863018-28006-5-git-send-email-justinpopo6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1681863018-28006-5-git-send-email-justinpopo6@gmail.com>
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
Cc: devicetree@vger.kernel.org, f.fainelli@gmail.com, opendmb@gmail.com,
 christian.koenig@amd.com, linux@armlinux.org.uk, netdev@vger.kernel.org,
 richardcochran@gmail.com, hkallweit1@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, justin.chen@broadcom.com,
 linaro-mm-sig@lists.linaro.org, edumazet@google.com, robh+dt@kernel.org,
 bcm-kernel-feedback-list@broadcom.com, krzysztof.kozlowski+dt@linaro.org,
 kuba@kernel.org, pabeni@redhat.com, sumit.semwal@linaro.org,
 davem@davemloft.net, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 18, 2023 at 05:10:16PM -0700, Justin Chen wrote:
> Add mdio compat string for ASP 2.0 ethernet driver.
> 
> Signed-off-by: Justin Chen <justinpopo6@gmail.com>
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
