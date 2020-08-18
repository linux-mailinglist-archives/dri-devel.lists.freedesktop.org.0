Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F50D248231
	for <lists+dri-devel@lfdr.de>; Tue, 18 Aug 2020 11:50:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B4FA897FB;
	Tue, 18 Aug 2020 09:50:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19DAB897FB
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 09:50:12 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DA2C6206B5;
 Tue, 18 Aug 2020 09:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597744211;
 bh=yHf1nMj3qSYZwUigpJ5j0pYaeeJWLk/yS+cy6ITwANY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=liTMIz6hJDZRUcSkh07kCLC8p+qLdxZhE7fdaNfCrfxOo5TSNthAN8tgGDUh8Lrtm
 bIhACY4MVrYo0IYYuil/PaL0do07nGkC9u2NDHNTfxHpfRuu58iNwhQ4j4lH4uxHSA
 SoC2ELSnGZAwWUWDfFDt2AWQZ0RGrI3VktJ3M9kE=
Date: Tue, 18 Aug 2020 11:50:35 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Tomer Samara <tomersamara98@gmail.com>
Subject: Re: [PATCH 0/4] *** SUBJECT HERE ***
Message-ID: <20200818095035.GA56916@kroah.com>
References: <cover.1597742228.git.tomersamara98@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1597742228.git.tomersamara98@gmail.com>
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
Cc: devel@driverdev.osuosl.org, Todd Kjos <tkjos@android.com>,
 Martijn Coenen <maco@android.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Joel Fernandes <joel@joelfernandes.org>,
 Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
 Hridya Valsaraju <hridya@google.com>, Suren Baghdasaryan <surenb@google.com>,
 Christian Brauner <christian@brauner.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 18, 2020 at 12:17:08PM +0300, Tomer Samara wrote:
> *** BLURB HERE ***

Really?

And your subject line could use some work too :(

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
